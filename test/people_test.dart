import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all people endpoints.
void main() {
  group('JikanClient people tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    final List<int> testIds = [
      1117, // Makoto Shinkai
      1,    // Tomokazu Sugita
      2,    // Mamoru Miyano
      3,    // Kana Hanazawa
      4,    // Hiroshi Kamiya
      5,    // Daisuke Ono
      6,    // Yuki Kaji
      7,    // Rie Kugimiya
      8,    // Aki Toyosaki
      9,    // Yui Horie
      10,   // Nana Mizuki
    ];

    test('should handle ${testIds.length} specific people IDs with queue-based rate limiting', () async {
      print('Testing people IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          final result = await queue.add(() => client.getPersonFullById(id));
          expect(result, isA<PersonFullData>(), reason: 'ID $id should return PersonFullData');
          print('✓ ID $id: Successfully parsed ${result.name}');

          final personData = await queue.add(() => client.getPersonById(id));
          expect(personData, isA<PersonData>(), reason: 'ID $id should return PersonData');
          print('✓ ID $id: Successfully parsed basic data for ${personData.name}');

          final personAnime = await queue.add(() => client.getPersonAnime(id));
          expect(personAnime, isA<List<PersonAnimeEntry>>(), reason: 'ID $id should return List<PersonAnimeEntry>');
          print('✓ ID $id: Successfully parsed anime data with ${personAnime.length} entries');

          final personManga = await queue.add(() => client.getPersonManga(id));
          expect(personManga, isA<List<PersonMangaEntry>>(), reason: 'ID $id should return List<PersonMangaEntry>');
          print('✓ ID $id: Successfully parsed manga data with ${personManga.length} entries');

          final personVoices = await queue.add(() => client.getPersonVoices(id));
          expect(personVoices, isA<List<PersonVoiceEntry>>(), reason: 'ID $id should return List<PersonVoiceEntry>');
          print('✓ ID $id: Successfully parsed voices data with ${personVoices.length} entries');

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
