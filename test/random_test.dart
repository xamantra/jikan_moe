import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all random endpoints.
void main() {
  group('JikanClient random tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle random anime and manga', () async {
      for (int i = 1; i <= 10; i++) {
        final randomAnime = await queue.add(() => client.getRandomAnime());
        expect(randomAnime, isA<AnimeData>(), reason: 'should return AnimeData');
        print('✓ RandomAnime $i: Successfully parsed ${randomAnime.title}');

        final randomManga = await queue.add(() => client.getRandomManga());
        expect(randomManga, isA<MangaData>(), reason: 'should return MangaData');
        print('✓ RandomManga $i: Successfully parsed ${randomManga.title}');

        final randomCharacters = await queue.add(() => client.getRandomCharacters());
        expect(randomCharacters, isA<CharacterData>(), reason: 'should return CharacterData');
        print('✓ RandomCharacters $i: Successfully parsed ${randomCharacters.name}');

        final randomPeople = await queue.add(() => client.getRandomPeople());
        expect(randomPeople, isA<PersonData>(), reason: 'should return PersonData');
        print('✓ RandomPeople $i: Successfully parsed ${randomPeople.name}');

        final randomUsers = await queue.add(() => client.getRandomUsers());
        expect(randomUsers, isA<RandomUserData>(), reason: 'should return RandomUserData');
        print('✓ RandomUsers $i: Successfully parsed ${randomUsers.username}');
      }
    });
  }, timeout: Timeout(Duration(minutes: 60)));
}
