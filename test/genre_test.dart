import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all genre endpoints.
void main() {
  group('JikanClient genre tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle anime and manga genres', () async {
      // Test anime genres
      final animeResult = await queue.add(
        () => client.getAnimeGenres(),
      );
      expect(animeResult, isA<List<AnimeGenreData>>(), reason: 'should return List<AnimeGenreData>');
      print('✓ AnimeGenres: Successfully parsed ${animeResult.length} anime genres');

      final animeGenresFilter = await queue.add(() => client.getAnimeGenres(filter: 'genres'));
      expect(animeGenresFilter, isA<List<AnimeGenreData>>(), reason: 'should return List<AnimeGenreData>');
      print('✓ AnimeGenres: Successfully parsed ${animeGenresFilter.length} anime genres for <filter: genres>');

      final animeExplicitGenresFilter = await queue.add(() => client.getAnimeGenres(filter: 'explicit_genres'));
      expect(animeExplicitGenresFilter, isA<List<AnimeGenreData>>(), reason: 'should return List<AnimeGenreData>');
      print('✓ AnimeGenres: Successfully parsed ${animeExplicitGenresFilter.length} anime genres for <filter: explicit_genres>');

      final animeThemesFilter = await queue.add(() => client.getAnimeGenres(filter: 'themes'));
      expect(animeThemesFilter, isA<List<AnimeGenreData>>(), reason: 'should return List<AnimeGenreData>');
      print('✓ AnimeGenres: Successfully parsed ${animeThemesFilter.length} anime genres for <filter: themes>');

      final animeDemographicsFilter = await queue.add(() => client.getAnimeGenres(filter: 'demographics'));
      expect(animeDemographicsFilter, isA<List<AnimeGenreData>>(), reason: 'should return List<AnimeGenreData>');
      print('✓ AnimeGenres: Successfully parsed ${animeDemographicsFilter.length} anime genres for <filter: demographics>');

      // Test manga genres
      final mangaResult = await queue.add(
        () => client.getMangaGenres(),
      );
      expect(mangaResult, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${mangaResult.length} manga genres');

      final mangaGenresFilter = await queue.add(() => client.getMangaGenres(filter: 'genres'));
      expect(mangaGenresFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${mangaGenresFilter.length} manga genres for <filter: genres>');

      final mangaExplicitGenresFilter = await queue.add(() => client.getMangaGenres(filter: 'explicit_genres'));
      expect(mangaExplicitGenresFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${mangaExplicitGenresFilter.length} manga genres for <filter: explicit_genres>');

      final mangaThemesFilter = await queue.add(() => client.getMangaGenres(filter: 'themes'));
      expect(mangaThemesFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${mangaThemesFilter.length} manga genres for <filter: themes>');

      final mangaDemographicsFilter = await queue.add(() => client.getMangaGenres(filter: 'demographics'));
      expect(mangaDemographicsFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${mangaDemographicsFilter.length} manga genres for <filter: demographics>');
    });
  });
}
