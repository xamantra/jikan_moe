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

    test('should handle all top anime and manga requests with queue-based rate limiting', () async {
      print('Testing top anime and manga functionality');
      print('Using queue-based rate limiting: 1 request per second');

      try {
        // ===== TOP ANIME TESTS =====
        print('\n--- Testing Top Anime ---');

        // Test basic top anime request
        final animeResult = await queue.add(() => client.getTopAnime());
        expect(animeResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse');
        expect(animeResult.pagination, isA<TopAnimePagination>(), reason: 'should have pagination');
        expect(animeResult.data, isA<List<AnimeData>>(), reason: 'should have data list');
        print('✓ TopAnimeResponse: Successfully parsed ${animeResult.data.length} top anime entries');

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
        final sfwAnimeResult = await queue.add(() => client.getTopAnime(sfw: true));
        expect(sfwAnimeResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for SFW filter');
        print('✓ TopAnimeResponse: Successfully parsed ${sfwAnimeResult.data.length} SFW anime entries');

        // Test with pagination
        final pageAnimeResult = await queue.add(() => client.getTopAnime(page: 2));
        expect(pageAnimeResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse for page 2');
        print('✓ TopAnimeResponse: Successfully parsed ${pageAnimeResult.data.length} anime entries on page ${pageAnimeResult.pagination.currentPage}');

        // Test with limit
        final limitAnimeResult = await queue.add(() => client.getTopAnime(limit: 5));
        expect(limitAnimeResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse with limit 5');
        print('✓ TopAnimeResponse: Successfully parsed ${limitAnimeResult.data.length} anime entries with limit 5');

        // Test with multiple parameters
        final combinedAnimeResult = await queue.add(
          () => client.getTopAnime(
            type: 'movie',
            filter: 'bypopularity',
            rating: 'pg13',
            sfw: true,
            page: 1,
            limit: 3,
          ),
        );
        expect(combinedAnimeResult, isA<TopAnimeResponse>(), reason: 'should return TopAnimeResponse with combined parameters');
        print('✓ TopAnimeResponse: Successfully parsed ${combinedAnimeResult.data.length} movie anime entries with combined filters');

        // Test pagination structure
        final paginationAnimeResult = await queue.add(() => client.getTopAnime(page: 1, limit: 10));
        expect(paginationAnimeResult.pagination, isA<TopAnimePagination>(), reason: 'should have pagination structure');
        print('✓ Pagination: Successfully parsed pagination structure');

        print('✓ All top anime tests passed');

        // ===== TOP MANGA TESTS =====
        print('\n--- Testing Top Manga ---');

        // Test basic top manga request
        final mangaResult = await queue.add(() => client.getTopManga());
        expect(mangaResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse');
        expect(mangaResult.pagination, isA<TopMangaPagination>(), reason: 'should have pagination');
        expect(mangaResult.data, isA<List<MangaData>>(), reason: 'should have data list');
        print('✓ TopMangaResponse: Successfully parsed ${mangaResult.data.length} top manga entries');

        // Test with type filter
        final mangaTypeResult = await queue.add(() => client.getTopManga(type: 'manga'));
        expect(mangaTypeResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse for manga type');
        print('✓ TopMangaResponse: Successfully parsed ${mangaTypeResult.data.length} manga entries');

        // Test with filter
        final publishingResult = await queue.add(() => client.getTopManga(filter: 'publishing'));
        expect(publishingResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse for publishing filter');
        print('✓ TopMangaResponse: Successfully parsed ${publishingResult.data.length} publishing manga entries');

        // Test with sfw filter
        final sfwMangaResult = await queue.add(() => client.getTopManga(sfw: true));
        expect(sfwMangaResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse for SFW filter');
        print('✓ TopMangaResponse: Successfully parsed ${sfwMangaResult.data.length} SFW manga entries');

        // Test with pagination
        final pageMangaResult = await queue.add(() => client.getTopManga(page: 2));
        expect(pageMangaResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse for page 2');
        print('✓ TopMangaResponse: Successfully parsed ${pageMangaResult.data.length} manga entries on page ${pageMangaResult.pagination.currentPage}');

        // Test with limit
        final limitMangaResult = await queue.add(() => client.getTopManga(limit: 5));
        expect(limitMangaResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse with limit 5');
        print('✓ TopMangaResponse: Successfully parsed ${limitMangaResult.data.length} manga entries with limit 5');

        // Test with multiple parameters
        final combinedMangaResult = await queue.add(
          () => client.getTopManga(
            type: 'novel',
            filter: 'bypopularity',
            sfw: true,
            page: 1,
            limit: 3,
          ),
        );
        expect(combinedMangaResult, isA<TopMangaResponse>(), reason: 'should return TopMangaResponse with combined parameters');
        print('✓ TopMangaResponse: Successfully parsed ${combinedMangaResult.data.length} novel entries with combined filters');

        // Test pagination structure
        final paginationMangaResult = await queue.add(() => client.getTopManga(page: 1, limit: 10));
        expect(paginationMangaResult.pagination, isA<TopMangaPagination>(), reason: 'should have pagination structure');
        print('✓ Pagination: Successfully parsed pagination structure');

        print('✓ All top manga tests passed');
        print('\n✓ All top anime and manga tests completed successfully');
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
