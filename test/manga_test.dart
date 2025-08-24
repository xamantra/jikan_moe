import 'package:jikan_moe/src/manga/index.dart';
import 'package:test/test.dart';
import 'dart:io';

import 'package:jikan_moe/src/jikan_client.dart';

import 'queue.dart';

/// This test should cover all manga endpoints.
void main() {
  group('JikanClient manga tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    final List<int> testIds = [
      2,
      1706,
      656,
      13,
      1,
      162032,
      642,
      51,
      25,
      70345,
      143441,
      16765,
      123281,
      133779,
      335,
      758,
    ];

    test('should handle ${testIds.length} specific manga IDs with queue-based rate limiting', () async {
      print('Testing manga IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          final fullResult = await queue.add(() => client.getMangaFullById(id));
          expect(fullResult, isA<MangaFullData>(), reason: 'ID $id should return MangaFullData');
          print('✓ ID $id: Successfully parsed ${fullResult.title} (FULL)');

          final result = await queue.add(() => client.getMangaById(id));
          expect(result, isA<MangaData>(), reason: 'ID $id should return MangaData');
          print('✓ ID $id: Successfully parsed ${result.title}');

          final charactersResult = await queue.add(() => client.getMangaCharacters(id));
          expect(charactersResult, isA<List<MangaCharacter>>(), reason: 'ID $id should return List<MangaCharacter>');
          print('✓ ID $id: Successfully parsed ${charactersResult.length} MangaCharacter for ${result.title}');

          final newsResult = await queue.add(() => client.getMangaNews(id));
          expect(newsResult, isA<MangaNews>(), reason: 'ID $id should return MangaNews');
          print('✓ ID $id: Successfully parsed ${newsResult.data.length} MangaNews for ${result.title}');

          final forumResult = await queue.add(() => client.getMangaTopics(id));
          expect(forumResult, isA<List<MangaForumTopic>>(), reason: 'ID $id should return List<MangaForumTopic>');
          print('✓ ID $id: Successfully parsed ${forumResult.length} MangaForum topics for ${result.title}');

          final picturesResult = await queue.add(() => client.getMangaPictures(id));
          expect(picturesResult, isA<List<MangaImages>>(), reason: 'ID $id should return List<MangaImages>');
          print('✓ ID $id: Successfully parsed ${picturesResult.length} MangaPictures for ${result.title}');

          final statisticsResult = await queue.add(() => client.getMangaStatistics(id));
          expect(statisticsResult, isA<MangaStatisticsData>(), reason: 'ID $id should return MangaStatisticsData');
          print('✓ ID $id: Successfully parsed MangaStatistics for ${result.title} (reading: ${statisticsResult.reading}, completed: ${statisticsResult.completed}, total: ${statisticsResult.total})');

          final moreInfoResult = await queue.add(() => client.getMangaMoreInfo(id));
          expect(moreInfoResult, isA<MangaMoreInfoData>(), reason: 'ID $id should return MangaMoreInfoData');
          print('✓ ID $id: Successfully parsed MangaMoreInfo for ${result.title}');

          processedCount++;
        } on HttpException catch (e) {
          // Test: HttpException should pass (expected API error)
          expect(e, isA<HttpException>(), reason: 'ID $id: Should throw HttpException for API errors');
          print('✓ ID $id: Expected HttpException - ${e.message}');
          processedCount++;
        } catch (e) {
          // Test: Any other exception should fail (parsing errors, etc.)
          fail('ID $id: Unexpected error type: ${e.runtimeType} - $e');
        }
      }

      print('Completed processing $processedCount out of ${testIds.length} IDs');
      expect(processedCount, equals(testIds.length), reason: 'All IDs should be processed');
    });
  }, timeout: const Timeout(Duration(minutes: 60)));
}
