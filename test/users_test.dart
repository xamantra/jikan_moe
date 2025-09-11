import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all users endpoints.
void main() {
  group('JikanClient users tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    final List<String> randomUserQuery = [
      'purplemon',
      'naruto',
      'anime',
      'manga',
      'test',
      'user',
      'admin',
      'moderator',
      'fan',
      'otaku',
    ];

    test('should handle users search', () async {
      // Pick one random query from the list
      final selectedQuery = (randomUserQuery..shuffle()).first;

      final result = await queue.add(
        () => client.getUsersSearch(q: selectedQuery),
      );
      expect(result, isA<UsersSearchResponse>(), reason: 'should return UsersSearchResponse');
      print('✓ UsersSearchResponse: Successfully parsed ${result.data.length} UsersSearchData for <q: $selectedQuery>');

      final withPage = await queue.add(() => client.getUsersSearch(q: selectedQuery, page: 1, limit: 10));
      expect(withPage, isA<UsersSearchResponse>(), reason: 'should return UsersSearchResponse');
      print('✓ UsersSearchResponse: Successfully parsed ${withPage.data.length} UsersSearchData for <q: $selectedQuery, page: 1, limit: 10>');

      final withGender = await queue.add(() => client.getUsersSearch(q: selectedQuery, gender: 'any'));
      expect(withGender, isA<UsersSearchResponse>(), reason: 'should return UsersSearchResponse');
      print('✓ UsersSearchResponse: Successfully parsed ${withGender.data.length} UsersSearchData for <q: $selectedQuery, gender: any>');

      final withAgeRange = await queue.add(() => client.getUsersSearch(q: selectedQuery, minAge: 18, maxAge: 30));
      expect(withAgeRange, isA<UsersSearchResponse>(), reason: 'should return UsersSearchResponse');
      print('✓ UsersSearchResponse: Successfully parsed ${withAgeRange.data.length} UsersSearchData for <q: $selectedQuery, minAge: 18, maxAge: 30>');

      // pick one random user from the result
      if (result.data.isNotEmpty) {
        final randomUser = result.data.first;
        print('checking full profile for user <${randomUser.username}>');
        final fullProfile = await queue.add(() => client.getUserFullProfile(randomUser.username));
        expect(fullProfile, isA<UsersFullResponse>(), reason: 'should return UsersFullResponse');
        print('✓ UsersFullResponse: Successfully parsed full profile for user <${randomUser.username}>');

        // test getUserById here
        final userById = await queue.add(() => client.getUserById(fullProfile.data.malId));
        expect(userById, isA<UsersIdResponse>(), reason: 'should return UsersIdResponse');
        print('✓ UsersIdResponse: Successfully parsed user by ID <${fullProfile.data.malId}>');
      }
    });
  }, timeout: const Timeout(Duration(minutes: 5)));
}
