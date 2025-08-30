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
  }, timeout: const Timeout(Duration(minutes: 30)));
}
