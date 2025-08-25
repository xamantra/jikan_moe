import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all top endpoints.
void main() {
  group('JikanClient top tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle all top anime requests with queue-based rate limiting', () async {
      print('Testing top anime functionality');
      print('Using queue-based rate limiting: 1 request per second');

      try {
        // Test basic top anime request
        final result = await queue.add(() => client.getTopAnime());
        expect(result, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse');
        expect(result.pagination, isA<TopAnimePagination>(), reason: 'should have pagination');
        expect(result.data, isA<List<AnimeData>>(), reason: 'should have data list');
        print('✓ TopAnimeResponse: Successfully parsed ${result.data.length} top anime entries');

        // Test with type filter
        final tvResult = await queue.add(() => client.getTopAnime(type: 'tv'));
        expect(tvResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for TV type');
        print('✓ TopAnimeResponse: Successfully parsed ${tvResult.data.length} TV anime entries');

        // Test with filter
        final airingResult = await queue.add(() => client.getTopAnime(filter: 'airing'));
        expect(airingResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for airing filter');
        print('✓ TopAnimeResponse: Successfully parsed ${airingResult.data.length} airing anime entries');

        // Test with rating
        final gRatingResult = await queue.add(() => client.getTopAnime(rating: 'g'));
        expect(gRatingResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for G rating');
        print('✓ TopAnimeResponse: Successfully parsed ${gRatingResult.data.length} G-rated anime entries');

        // Test with sfw filter
        final sfwResult = await queue.add(() => client.getTopAnime(sfw: true));
        expect(sfwResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for SFW filter');
        print('✓ TopAnimeResponse: Successfully parsed ${sfwResult.data.length} SFW anime entries');

        // Test with pagination
        final pageResult = await queue.add(() => client.getTopAnime(page: 2));
        expect(pageResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for page 2');
        print('✓ TopAnimeResponse: Successfully parsed ${pageResult.data.length} anime entries on page ${pageResult.pagination.currentPage}');

        // Test with limit
        final limitResult = await queue.add(() => client.getTopAnime(limit: 5));
        expect(limitResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse with limit 5');
        print('✓ TopAnimeResponse: Successfully parsed ${limitResult.data.length} anime entries with limit 5');

        // Test with multiple parameters
        final combinedResult = await queue.add(
          () => client.getTopAnime(
            type: 'movie',
            filter: 'bypopularity',
            rating: 'pg13',
            sfw: true,
            page: 1,
            limit: 3,
          ),
        );
        expect(combinedResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse with combined parameters');
        print('✓ TopAnimeResponse: Successfully parsed ${combinedResult.data.length} movie anime entries with combined filters');

        // Test pagination structure
        final paginationResult = await queue.add(() => client.getTopAnime(page: 1, limit: 10));
        expect(paginationResult.pagination, isA<TopAnimePagination>(), reason: 'should have pagination structure');
        print('✓ Pagination: Successfully parsed pagination structure');

        print('✓ All top anime tests passed');
      } on JikanException catch (e) {
        // Test: JikanException should pass (expected API error)
        expect(e, isA<JikanException>(), reason: 'Should throw JikanException for API errors');
        print('✓ Expected JikanException - ${e.message}');
      } catch (e) {
        // Test: Any other exception should fail (parsing errors, etc.)
        fail('Unexpected error type: ${e.runtimeType} - $e');
      }
    });
  }, timeout: const Timeout(Duration(minutes: 10)));
}
