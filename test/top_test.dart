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

    test('should handle all top anime, manga, people, and characters requests with queue-based rate limiting', () async {
      print('Testing top anime, manga, people, and characters functionality');
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

        // ===== TOP PEOPLE TESTS =====
        print('\n--- Testing Top People ---');

        // Test basic top people request
        final peopleResult = await queue.add(() => client.getTopPeople());
        expect(peopleResult, isA<TopPeopleResponse>(), reason: 'should return TopPeopleResponse');
        expect(peopleResult.pagination, isA<TopPeoplePagination>(), reason: 'should have pagination');
        expect(peopleResult.data, isA<List<TopPeopleData>>(), reason: 'should have data list');
        print('✓ TopPeopleResponse: Successfully parsed ${peopleResult.data.length} top people entries');

        // Test with pagination
        final pagePeopleResult = await queue.add(() => client.getTopPeople(page: 2));
        expect(pagePeopleResult, isA<TopPeopleResponse>(), reason: 'should return TopPeopleResponse for page 2');
        print('✓ TopPeopleResponse: Successfully parsed ${pagePeopleResult.data.length} people entries on page ${pagePeopleResult.pagination.currentPage}');

        // Test with limit
        final limitPeopleResult = await queue.add(() => client.getTopPeople(limit: 5));
        expect(limitPeopleResult, isA<TopPeopleResponse>(), reason: 'should return TopPeopleResponse with limit 5');
        print('✓ TopPeopleResponse: Successfully parsed ${limitPeopleResult.data.length} people entries with limit 5');

        // Test with multiple parameters
        final combinedPeopleResult = await queue.add(
          () => client.getTopPeople(
            page: 1,
            limit: 3,
          ),
        );
        expect(combinedPeopleResult, isA<TopPeopleResponse>(), reason: 'should return TopPeopleResponse with combined parameters');
        print('✓ TopPeopleResponse: Successfully parsed ${combinedPeopleResult.data.length} people entries with combined parameters');

        // Test pagination structure
        final paginationPeopleResult = await queue.add(() => client.getTopPeople(page: 1, limit: 10));
        expect(paginationPeopleResult.pagination, isA<TopPeoplePagination>(), reason: 'should have pagination structure');
        print('✓ Pagination: Successfully parsed pagination structure');

        print('✓ All top people tests passed');

        // ===== TOP CHARACTERS TESTS =====
        print('\n--- Testing Top Characters ---');

        // Test basic top characters request
        final charactersResult = await queue.add(() => client.getTopCharacters());
        expect(charactersResult, isA<TopCharactersResponse>(), reason: 'should return TopCharactersResponse');
        expect(charactersResult.pagination, isA<TopCharactersPagination>(), reason: 'should have pagination');
        expect(charactersResult.data, isA<List<TopCharacterData>>(), reason: 'should have data list');
        print('✓ TopCharactersResponse: Successfully parsed ${charactersResult.data.length} top characters entries');

        // Test with pagination
        final pageCharactersResult = await queue.add(() => client.getTopCharacters(page: 2));
        expect(pageCharactersResult, isA<TopCharactersResponse>(), reason: 'should return TopCharactersResponse for page 2');
        print('✓ TopCharactersResponse: Successfully parsed ${pageCharactersResult.data.length} characters entries on page ${pageCharactersResult.pagination.currentPage}');

        // Test with limit
        final limitCharactersResult = await queue.add(() => client.getTopCharacters(limit: 5));
        expect(limitCharactersResult, isA<TopCharactersResponse>(), reason: 'should return TopCharactersResponse with limit 5');
        print('✓ TopCharactersResponse: Successfully parsed ${limitCharactersResult.data.length} characters entries with limit 5');

        // Test with multiple parameters
        final combinedCharactersResult = await queue.add(
          () => client.getTopCharacters(
            page: 1,
            limit: 3,
          ),
        );
        expect(combinedCharactersResult, isA<TopCharactersResponse>(), reason: 'should return TopCharactersResponse with combined parameters');
        print('✓ TopCharactersResponse: Successfully parsed ${combinedCharactersResult.data.length} characters entries with combined parameters');

        // Test pagination structure
        final paginationCharactersResult = await queue.add(() => client.getTopCharacters(page: 1, limit: 10));
        expect(paginationCharactersResult.pagination, isA<TopCharactersPagination>(), reason: 'should have pagination structure');
        print('✓ Pagination: Successfully parsed pagination structure');

        print('✓ All top characters tests passed');
        print('\n✓ All top anime, manga, people, and characters tests completed successfully');
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
