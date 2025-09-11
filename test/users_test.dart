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
      'stark',
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

        final userById = await queue.add(() => client.getUserById(fullProfile.data.malId));
        expect(userById, isA<UsersIdResponse>(), reason: 'should return UsersIdResponse');
        print('✓ UsersIdResponse: Successfully parsed user by ID <${fullProfile.data.malId}>');

        final userProfile = await queue.add(() => client.getUserProfile(randomUser.username));
        expect(userProfile, isA<UsersProfileResponse>(), reason: 'should return UsersProfileResponse');
        print('✓ UsersProfileResponse: Successfully parsed profile for user <${randomUser.username}>');

        final userStatistics = await queue.add(() => client.getUserStatistics(randomUser.username));
        expect(userStatistics, isA<UsersStatisticsResponse>(), reason: 'should return UsersStatisticsResponse');
        print('✓ UsersStatisticsResponse: Successfully parsed statistics for user <${randomUser.username}>');

        final userFavorites = await queue.add(() => client.getUserFavorites(randomUser.username));
        expect(userFavorites, isA<UsersFavoritesResponse>(), reason: 'should return UsersFavoritesResponse');
        print('✓ UsersFavoritesResponse: Successfully parsed favorites for user <${randomUser.username}>');

        final userUpdates = await queue.add(() => client.getUserUpdates(randomUser.username));
        expect(userUpdates, isA<UsersUpdatesResponse>(), reason: 'should return UsersUpdatesResponse');
        print('✓ UsersUpdatesResponse: Successfully parsed ${userUpdates.data.anime.length} anime updates and ${userUpdates.data.manga.length} manga updates for user <${randomUser.username}>');
      }
    });
  }, timeout: const Timeout(Duration(minutes: 5)));
}
