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

    test('should handle manga genres', () async {
      final result = await queue.add(
        () => client.getMangaGenres(),
      );
      expect(result, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${result.length} manga genres');

      final genresFilter = await queue.add(() => client.getMangaGenres(filter: 'genres'));
      expect(genresFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${genresFilter.length} manga genres for <filter: genres>');

      final explicitGenresFilter = await queue.add(() => client.getMangaGenres(filter: 'explicit_genres'));
      expect(explicitGenresFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${explicitGenresFilter.length} manga genres for <filter: explicit_genres>');

      final themesFilter = await queue.add(() => client.getMangaGenres(filter: 'themes'));
      expect(themesFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${themesFilter.length} manga genres for <filter: themes>');

      final demographicsFilter = await queue.add(() => client.getMangaGenres(filter: 'demographics'));
      expect(demographicsFilter, isA<List<MangaGenreData>>(), reason: 'should return List<MangaGenreData>');
      print('✓ MangaGenres: Successfully parsed ${demographicsFilter.length} manga genres for <filter: demographics>');
    });
  });
}
