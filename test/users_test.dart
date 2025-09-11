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

        final userAbout = await queue.add(() => client.getUserAbout(randomUser.username));
        expect(userAbout, isA<UsersAboutResponse>(), reason: 'should return UsersAboutResponse');
        print('✓ UsersAboutResponse: Successfully parsed about content for user <${randomUser.username}>');

        final userHistory = await queue.add(() => client.getUserHistory(randomUser.username));
        expect(userHistory, isA<UsersHistoryResponse>(), reason: 'should return UsersHistoryResponse');
        print('✓ UsersHistoryResponse: Successfully parsed ${userHistory.data.length} history entries for user <${randomUser.username}>');

        final userHistoryAnime = await queue.add(() => client.getUserHistory(randomUser.username, type: 'anime'));
        expect(userHistoryAnime, isA<UsersHistoryResponse>(), reason: 'should return UsersHistoryResponse');
        print('✓ UsersHistoryResponse: Successfully parsed ${userHistoryAnime.data.length} anime history entries for user <${randomUser.username}>');

        final userHistoryManga = await queue.add(() => client.getUserHistory(randomUser.username, type: 'manga'));
        expect(userHistoryManga, isA<UsersHistoryResponse>(), reason: 'should return UsersHistoryResponse');
        print('✓ UsersHistoryResponse: Successfully parsed ${userHistoryManga.data.length} manga history entries for user <${randomUser.username}>');

        final userFriends = await queue.add(() => client.getUserFriends(randomUser.username));
        expect(userFriends, isA<UsersFriendsResponse>(), reason: 'should return UsersFriendsResponse');
        print('✓ UsersFriendsResponse: Successfully parsed ${userFriends.data.length} friends for user <${randomUser.username}>');

        final userFriendsWithPage = await queue.add(() => client.getUserFriends(randomUser.username, page: 1));
        expect(userFriendsWithPage, isA<UsersFriendsResponse>(), reason: 'should return UsersFriendsResponse');
        print('✓ UsersFriendsResponse: Successfully parsed ${userFriendsWithPage.data.length} friends for user <${randomUser.username}> with page 1');

        final userReviews = await queue.add(() => client.getUserReviews(randomUser.username));
        expect(userReviews, isA<UsersReviewsResponse>(), reason: 'should return UsersReviewsResponse');
        print('✓ UsersReviewsResponse: Successfully parsed ${userReviews.data.length} reviews for user <${randomUser.username}>');

        final userReviewsWithPage = await queue.add(() => client.getUserReviews(randomUser.username, page: 1));
        expect(userReviewsWithPage, isA<UsersReviewsResponse>(), reason: 'should return UsersReviewsResponse');
        print('✓ UsersReviewsResponse: Successfully parsed ${userReviewsWithPage.data.length} reviews for user <${randomUser.username}> with page 1');

        final userRecommendations = await queue.add(() => client.getUserRecommendations(randomUser.username));
        expect(userRecommendations, isA<UsersRecommendationsResponse>(), reason: 'should return UsersRecommendationsResponse');
        print('✓ UsersRecommendationsResponse: Successfully parsed ${userRecommendations.data.length} recommendations for user <${randomUser.username}>');

        final userRecommendationsWithPage = await queue.add(() => client.getUserRecommendations(randomUser.username, page: 1));
        expect(userRecommendationsWithPage, isA<UsersRecommendationsResponse>(), reason: 'should return UsersRecommendationsResponse');
        print('✓ UsersRecommendationsResponse: Successfully parsed ${userRecommendationsWithPage.data.length} recommendations for user <${randomUser.username}> with page 1');

        final userClubs = await queue.add(() => client.getUserClubs(randomUser.username));
        expect(userClubs, isA<UsersClubsResponse>(), reason: 'should return UsersClubsResponse');
        print('✓ UsersClubsResponse: Successfully parsed ${userClubs.data.length} clubs for user <${randomUser.username}>');

        final userClubsWithPage = await queue.add(() => client.getUserClubs(randomUser.username, page: 1));
        expect(userClubsWithPage, isA<UsersClubsResponse>(), reason: 'should return UsersClubsResponse');
        print('✓ UsersClubsResponse: Successfully parsed ${userClubsWithPage.data.length} clubs for user <${randomUser.username}> with page 1');

        final userExternal = await queue.add(() => client.getUserExternal(randomUser.username));
        expect(userExternal, isA<UsersExternalResponse>(), reason: 'should return UsersExternalResponse');
        print('✓ UsersExternalResponse: Successfully parsed ${userExternal.data.length} external links for user <${randomUser.username}>');
      }
    });
  }, timeout: const Timeout(Duration(minutes: 60)));
}
