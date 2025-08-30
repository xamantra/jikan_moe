import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all character endpoints.
void main() {
  group('JikanClient characters tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    final List<int> testIds = [
      27, 28, 4606, 4604, 40592, 40591, 258969, 268455, 198207, 260052, 260051, // IDs from existing comment
      40, // Luffy from One Piece (popular character)
      417, // Lelouch vi Britannia
      45627, // Rimuru Tempest
      71, // Ichigo Kurosaki
      13, // Monkey D. Luffy
      46, // Goku
    ];

    test('should handle ${testIds.length} specific character IDs with queue-based rate limiting', () async {
      print('Testing character IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          // Test getCharacterFullById endpoint
          final fullResult = await queue.add(() => client.getCharacterFullById(id));
          expect(fullResult, isA<CharacterFullData>(), reason: 'ID $id should return CharactersFullData');
          print('✓ ID $id: Successfully parsed ${fullResult.name} (full data)');
          print('  - Favorites: ${fullResult.favorites}');
          print('  - Anime appearances: ${fullResult.anime.length}');
          print('  - Manga appearances: ${fullResult.manga.length}');
          print('  - Voice actors: ${fullResult.voices.length}');

          // Test getCharacterById endpoint
          final basicResult = await queue.add(() => client.getCharacterById(id));
          expect(basicResult, isA<CharacterData>(), reason: 'ID $id should return CharactersData');
          print('✓ ID $id: Successfully parsed ${basicResult.name} (basic data)');
          print('  - Favorites: ${basicResult.favorites}');
          print('  - Nicknames: ${basicResult.nicknames.length}');
          print('  - About: ${basicResult.about != null ? "Available" : "Not available"}');

          // Test getCharacterAnime endpoint
          final animeResult = await queue.add(() => client.getCharacterAnime(id));
          expect(animeResult, isA<List<CharacterAnimeData>>(), reason: 'ID $id should return List<CharacterAnimeData>');
          print('✓ ID $id: Successfully parsed anime appearances (${animeResult.length} entries)');
          if (animeResult.isNotEmpty) {
            print('  - First anime: ${animeResult.first.anime.title} (${animeResult.first.role})');
          }

          // Test getCharacterManga endpoint
          final mangaResult = await queue.add(() => client.getCharacterManga(id));
          expect(mangaResult, isA<List<CharacterMangaData>>(), reason: 'ID $id should return List<CharacterMangaData>');
          print('✓ ID $id: Successfully parsed manga appearances (${mangaResult.length} entries)');
          if (mangaResult.isNotEmpty) {
            print('  - First manga: ${mangaResult.first.manga.title} (${mangaResult.first.role})');
          }

          // Test getCharacterVoices endpoint
          final voicesResult = await queue.add(() => client.getCharacterVoices(id));
          expect(voicesResult, isA<List<CharacterVoiceData>>(), reason: 'ID $id should return List<CharacterVoiceData>');
          print('✓ ID $id: Successfully parsed voice actors (${voicesResult.length} entries)');
          if (voicesResult.isNotEmpty) {
            print('  - First voice actor: ${voicesResult.first.person.name} (${voicesResult.first.language})');
          }

          // Test getCharacterPictures endpoint
          final picturesResult = await queue.add(() => client.getCharacterPictures(id));
          expect(picturesResult, isA<List<CharacterPicturesData>>(), reason: 'ID $id should return List<CharacterPicturesData>');
          print('✓ ID $id: Successfully parsed character pictures (${picturesResult.length} entries)');
          if (picturesResult.isNotEmpty) {
            print('  - First picture: ${picturesResult.first.jpg.imageUrl}');
          }

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

    test('should handle character search with queue-based rate limiting', () async {
      print('Testing character search endpoints');
      print('Using queue-based rate limiting: 1 request per second');

      try {
        // Test basic character search
        final searchResult = await queue.add(() => client.getCharactersSearch(q: 'Luffy'));
        expect(searchResult, isA<CharacterSearchResponse>(), reason: 'Should return CharacterSearchResponse');
        print('✓ Successfully parsed character search for "Luffy"');
        print('  - Total results: ${searchResult.pagination.items.total}');
        print('  - Current page: ${searchResult.pagination.currentPage}');
        print('  - Results on this page: ${searchResult.data.length}');
        if (searchResult.data.isNotEmpty) {
          print('  - First result: ${searchResult.data.first.name} (ID: ${searchResult.data.first.malId})');
        }

        // Test character search with pagination
        final searchResult2 = await queue.add(() => client.getCharactersSearch(q: 'Goku', page: 1, limit: 5));
        expect(searchResult2, isA<CharacterSearchResponse>(), reason: 'Should return CharacterSearchResponse');
        print('✓ Successfully parsed character search for "Goku" with pagination');
        print('  - Total results: ${searchResult2.pagination.items.total}');
        print('  - Results on this page: ${searchResult2.data.length}');
        print('  - Has next page: ${searchResult2.pagination.hasNextPage}');

        // Test character search with letter filter
        final searchResult3 = await queue.add(() => client.getCharactersSearch(letter: 'A', limit: 3));
        expect(searchResult3, isA<CharacterSearchResponse>(), reason: 'Should return CharacterSearchResponse');
        print('✓ Successfully parsed character search with letter filter "A"');
        print('  - Total results: ${searchResult3.pagination.items.total}');
        print('  - Results on this page: ${searchResult3.data.length}');
        if (searchResult3.data.isNotEmpty) {
          print('  - First result: ${searchResult3.data.first.name} (ID: ${searchResult3.data.first.malId})');
        }

        // Test character search with ordering
        final searchResult4 = await queue.add(() => client.getCharactersSearch(orderBy: 'favorites', sort: 'desc', limit: 3));
        expect(searchResult4, isA<CharacterSearchResponse>(), reason: 'Should return CharacterSearchResponse');
        print('✓ Successfully parsed character search ordered by favorites');
        print('  - Total results: ${searchResult4.pagination.items.total}');
        print('  - Results on this page: ${searchResult4.data.length}');
        if (searchResult4.data.isNotEmpty) {
          print('  - First result: ${searchResult4.data.first.name} (Favorites: ${searchResult4.data.first.favorites})');
        }
      } on JikanException catch (e) {
        // Test: JikanException should pass (expected API error)
        expect(e, isA<JikanException>(), reason: 'Should throw JikanException for API errors');
        print('✓ Expected JikanException - ${e.message}');
      } catch (e) {
        // Test: Any other exception should fail (parsing errors, etc.)
        fail('Unexpected error type: ${e.runtimeType} - $e');
      }
    });

    test('should handle random characters endpoint with queue-based rate limiting', () async {
      print('Testing random characters endpoint');
      print('Using queue-based rate limiting: 1 request per second');

      try {
        // Test getRandomCharacters endpoint
        final randomResult = await queue.add(() => client.getRandomCharacters());
        expect(randomResult, isA<CharacterData>(), reason: 'Should return CharacterData');
        print('✓ Successfully parsed random character');
        print('  - Name: ${randomResult.name}');
        print('  - ID: ${randomResult.malId}');
        print('  - Favorites: ${randomResult.favorites}');
        print('  - Nicknames: ${randomResult.nicknames.length}');
        print('  - About: ${randomResult.about != null ? "Available" : "Not available"}');
        print('  - Image URL: ${randomResult.images.jpg.imageUrl}');
      } on JikanException catch (e) {
        // Test: JikanException should pass (expected API error)
        expect(e, isA<JikanException>(), reason: 'Should throw JikanException for API errors');
        print('✓ Expected JikanException - ${e.message}');
      } catch (e) {
        // Test: Any other exception should fail (parsing errors, etc.)
        fail('Unexpected error type: ${e.runtimeType} - $e');
      }
    });
  }, timeout: const Timeout(Duration(minutes: 30)));
}
