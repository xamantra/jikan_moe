import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

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

    test('should handle manga search with various parameters', () async {
      print('Testing manga search functionality');
      print('Using queue-based rate limiting: 1 request per second');

      try {
        // Test basic search
        final searchResult = await queue.add(() => client.getMangaSearch(q: 'naruto'));
        expect(searchResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        expect(searchResult.data, isA<List<MangaSearchData>>(), reason: 'Should have data list');
        expect(searchResult.pagination, isA<MangaSearchPagination>(), reason: 'Should have pagination');
        print('✓ Basic search: Successfully parsed ${searchResult.data.length} results');

        // Test search with type filter
        final typeSearchResult = await queue.add(() => client.getMangaSearch(q: 'one piece', type: 'manga'));
        expect(typeSearchResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        print('✓ Type filter search: Successfully parsed ${typeSearchResult.data.length} results');

        // Test search with status filter
        final statusSearchResult = await queue.add(() => client.getMangaSearch(q: 'dragon ball', status: 'complete'));
        expect(statusSearchResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        print('✓ Status filter search: Successfully parsed ${statusSearchResult.data.length} results');

        // Test search with score filter
        final scoreSearchResult = await queue.add(() => client.getMangaSearch(q: 'attack on titan', minScore: 8.0));
        expect(scoreSearchResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        print('✓ Score filter search: Successfully parsed ${scoreSearchResult.data.length} results');

        // Test search with pagination
        final pageSearchResult = await queue.add(() => client.getMangaSearch(q: 'bleach', page: 2, limit: 10));
        expect(pageSearchResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        expect(pageSearchResult.pagination.currentPage, equals(2), reason: 'Should be on page 2');
        print('✓ Pagination search: Successfully parsed ${pageSearchResult.data.length} results on page ${pageSearchResult.pagination.currentPage}');

        final upcomingResult = await queue.add(() => client.getMangaSearch(status: 'upcoming'));
        expect(upcomingResult, isA<MangaSearchResponse>(), reason: 'Should return MangaSearchResponse');
        print('✓ Upcoming search: Successfully parsed ${upcomingResult.data.length} results');

        print('✓ All manga search tests passed');
      } on JikanException catch (e) {
        // Test: JikanException should pass (expected API error)
        expect(e, isA<JikanException>(), reason: 'Should throw JikanException for API errors');
        print('✓ Expected JikanException - ${e.message}');
      } catch (e) {
        // Test: Any other exception should fail (parsing errors, etc.)
        fail('Unexpected error type: ${e.runtimeType} - $e');
      }
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

          final recommendationsResult = await queue.add(() => client.getMangaRecommendations(id));
          expect(recommendationsResult, isA<List<MangaRecommendation>>(), reason: 'ID $id should return List<MangaRecommendation>');
          print('✓ ID $id: Successfully parsed ${recommendationsResult.length} MangaRecommendations for ${result.title}');

          final userUpdatesResult = await queue.add(() => client.getMangaUserUpdates(id));
          expect(userUpdatesResult, isA<MangaUserUpdates>(), reason: 'ID $id should return MangaUserUpdates');
          print('✓ ID $id: Successfully parsed ${userUpdatesResult.data.length} MangaUserUpdates for ${result.title}');

          final reviewsResult = await queue.add(() => client.getMangaReviews(id));
          expect(reviewsResult, isA<MangaReviews>(), reason: 'ID $id should return MangaReviews');
          print('✓ ID $id: Successfully parsed ${reviewsResult.data.length} MangaReviews for ${result.title}');

          final relationsResult = await queue.add(() => client.getMangaRelations(id));
          expect(relationsResult, isA<List<MangaRelation>>(), reason: 'ID $id should return List<MangaRelation>');
          print('✓ ID $id: Successfully parsed ${relationsResult.length} MangaRelations for ${result.title}');

          final externalResult = await queue.add(() => client.getMangaExternal(id));
          expect(externalResult, isA<List<MangaExternal>>(), reason: 'ID $id should return List<MangaExternal>');
          print('✓ ID $id: Successfully parsed ${externalResult.length} MangaExternal for ${result.title}');

          processedCount++;
        } on JikanException catch (e) {
          // Test: JikanException should pass (expected API error)
          expect(e, isA<JikanException>(), reason: 'ID $id: Should throw JikanException for API errors');
          print('✓ ID $id: Expected JikanException - ${e.message}');
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
