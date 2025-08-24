import 'package:jikan_moe/src/anime/index.dart';
import 'package:test/test.dart';
import 'dart:io';

import 'package:jikan_moe/src/jikan_client.dart';

import '../queue.dart';

void main() {
  group('JikanClient getAnimeEpisodes Tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    const int testCount = 15;

    test('should handle $testCount specific anime IDs with queue-based rate limiting', () async {
      final List<int> testIds = [
        59267,
        58772,
        60028,
        61200,
        58929,
        52991,
        5114,
        21,
        9253,
        28977,
        59845,
        53447,
        58913,
        44042,
        59062,
      ];

      print('Testing anime IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          final result = await queue.add(() => client.getAnimeEpisodes(id));

          if (result.data.isNotEmpty) {
            try {
              final randomEpisode = (result.data..shuffle()).first;
              final episodeResult = await queue.add(() => client.getAnimeEpisodeById(id, episode: randomEpisode.malId));
              expect(episodeResult, isA<AnimeEpisode>(), reason: 'ID $id: Should return AnimeEpisode');
              print('✓ ID $id: Successfully parsed ${episodeResult.title}');
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

          // Test: Should return AnimeEpisodes type
          expect(result, isA<AnimeEpisodes>(), reason: 'ID $id should return AnimeEpisodes');

          print('✓ ID $id: Successfully parsed ${result.data.length} episodes');
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

      print('Completed processing $processedCount out of $testCount IDs');
      expect(processedCount, equals(testCount), reason: 'All IDs should be processed');
    });
  }, timeout: Timeout(Duration(minutes: 5)));
}
