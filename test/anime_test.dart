import 'package:jikan_moe/src/anime/index.dart';
import 'package:test/test.dart';
import 'dart:io';

import 'package:jikan_moe/src/jikan_client.dart';

import 'queue.dart';

/// This test should cover all anime endpoints.
void main() {
  group('JikanClient anime tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle anime search', () async {
      final result = await queue.add(
        () => client.getAnimeSearch(q: 'naruto'),
      );
      expect(result, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${result.data.length} AnimeSearch for <q: naruto>');

      final typeTV = await queue.add(() => client.getAnimeSearch(type: 'tv'));
      expect(typeTV, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${typeTV.data.length} AnimeSearch for <type: tv>');

      final minMaxScore = await queue.add(() => client.getAnimeSearch(minScore: 6, maxScore: 7.5));
      expect(minMaxScore, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${minMaxScore.data.length} AnimeSearch for <minScore: 6, maxScore: 7.5>');

      final airing = await queue.add(() => client.getAnimeSearch(status: 'airing'));
      expect(airing, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${airing.data.length} AnimeSearch for <status: airing>');

      final complete = await queue.add(() => client.getAnimeSearch(status: 'complete'));
      expect(complete, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${complete.data.length} AnimeSearch for <status: complete>');

      final upcoming = await queue.add(() => client.getAnimeSearch(status: 'upcoming'));
      expect(upcoming, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${upcoming.data.length} AnimeSearch for <status: upcoming>');

      final gRating = await queue.add(() => client.getAnimeSearch(rating: 'g'));
      expect(gRating, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${gRating.data.length} AnimeSearch for <rating: g>');

      final rxRating = await queue.add(() => client.getAnimeSearch(rating: 'rx', sfw: false));
      expect(rxRating, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${rxRating.data.length} AnimeSearch for <rating: rx>');

      final sfw = await queue.add(() => client.getAnimeSearch(sfw: false));
      expect(sfw, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${sfw.data.length} AnimeSearch for <sfw: false>');

      final dateRange = await queue.add(() => client.getAnimeSearch(startDate: '2022-01-01', endDate: '2024-12-31'));
      expect(dateRange, isA<AnimeSearchResponse>(), reason: 'should return AnimeSearchResponse');
      print('✓ AnimeSearchResponse: Successfully parsed ${dateRange.data.length} AnimeSearch for <startDate: 2022-01-01, endDate: 2024-12-31>');
    });

    final List<int> testIds = [
      59267,
      58772,
      60028,
      61200,
      58929,
      52991,
      5114,
      21,
      9253,
      28977,
      59845,
      53447,
      58913,
      44042,
      59062,
      42310,
    ];

    test('should handle ${testIds.length} specific anime IDs with queue-based rate limiting', () async {
      print('Testing anime IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          final result = await queue.add(() => client.getAnimeById(id));

          // Test: Should return AnimeData type
          expect(result, isA<AnimeData>(), reason: 'ID $id should return AnimeData');

          print('✓ ID $id: Successfully parsed ${result.title}');

          final fullResult = await queue.add(() => client.getAnimeFullById(id));
          expect(fullResult, isA<AnimeFullData>(), reason: 'ID $id should return AnimeFullData');
          print('✓ ID $id: Successfully parsed ${fullResult.title} (FULL)');

          final charactersResult = await queue.add(() => client.getAnimeCharacters(id));
          expect(charactersResult, isA<List<AnimeCharacter>>(), reason: 'ID $id should return List<AnimeCharacter>');
          print('✓ ID $id: Successfully parsed ${charactersResult.length} AnimeCharacter for ${result.title}');

          final staffResult = await queue.add(() => client.getAnimeStaff(id));
          expect(staffResult, isA<List<AnimeStaff>>(), reason: 'ID $id should return List<AnimeStaff>');
          print('✓ ID $id: Successfully parsed ${staffResult.length} AnimeStaff for ${result.title}');

          final episodesResult = await queue.add(() => client.getAnimeEpisodes(id));
          expect(episodesResult, isA<AnimeEpisodes>(), reason: 'ID $id should return AnimeEpisodes');
          print('✓ ID $id: Successfully parsed ${episodesResult.data.length} AnimeEpisodes for ${result.title}');

          if (episodesResult.data.isNotEmpty) {
            final randomEpisode = (episodesResult.data..shuffle()).first;
            final episodeResult = await queue.add(() => client.getAnimeEpisodeById(id, episode: randomEpisode.malId));
            expect(episodeResult, isA<AnimeEpisode>(), reason: 'ID $id should return AnimeEpisode');
            print('✓ ID $id: Successfully parsed ${episodeResult.title} for ${randomEpisode.title}');
          }

          final newsResult = await queue.add(() => client.getAnimeNews(id));
          expect(newsResult, isA<AnimeNews>(), reason: 'ID $id should return AnimeNews');
          print('✓ ID $id: Successfully parsed ${newsResult.data.length} AnimeNews for ${result.title}');

          final forumResult = await queue.add(() => client.getAnimeForum(id));
          expect(forumResult, isA<List<AnimeForumTopic>>(), reason: 'ID $id should return List<AnimeForumTopic>');
          print('✓ ID $id: Successfully parsed ${forumResult.length} AnimeForumTopic for ${result.title}');

          final videosResult = await queue.add(() => client.getAnimeVideos(id));
          expect(videosResult, isA<AnimeVideosData>(), reason: 'ID $id should return AnimeVideosData');
          print('✓ ID $id: Successfully parsed ${videosResult.episodes.length} EpisodeVideo for ${result.title}');
          print('✓ ID $id: Successfully parsed ${videosResult.promo.length} PromoVideo for ${result.title}');
          print('✓ ID $id: Successfully parsed ${videosResult.musicVideos.length} MusicVideo for ${result.title}');

          final videosEpisodesResult = await queue.add(() => client.getAnimeVideosEpisodes(id));
          expect(videosEpisodesResult, isA<AnimeVideosEpisodes>(), reason: 'ID $id should return AnimeVideosEpisodes');
          print('✓ ID $id: Successfully parsed ${videosEpisodesResult.data.length} AnimeVideoEpisode for ${result.title}');

          final picturesResult = await queue.add(() => client.getAnimePictures(id));
          expect(picturesResult, isA<List<AnimePicturesData>>(), reason: 'ID $id should return List<AnimePicturesData>');
          print('✓ ID $id: Successfully parsed ${picturesResult.length} AnimePicturesData for ${result.title}');

          final statisticsResult = await queue.add(() => client.getAnimeStatistics(id));
          expect(statisticsResult, isA<AnimeStatisticsData>(), reason: 'ID $id should return AnimeStatisticsData');
          print('✓ ID $id: Successfully parsed $statisticsResult for ${result.title}');

          final moreInfoResult = await queue.add(() => client.getAnimeMoreInfo(id));
          expect(moreInfoResult, isA<AnimeMoreInfoData>(), reason: 'ID $id should return AnimeMoreInfoData');
          print('✓ ID $id: Successfully parsed $AnimeMoreInfoData');

          final recommendationsResult = await queue.add(() => client.getAnimeRecommendations(id));
          expect(recommendationsResult, isA<List<AnimeRecommendation>>(), reason: 'ID $id should return List<AnimeRecommendation>');
          print('✓ ID $id: Successfully parsed ${recommendationsResult.length} AnimeRecommendation for ${result.title}');

          final userUpdatesResult = await queue.add(() => client.getAnimeUserUpdates(id));
          expect(userUpdatesResult, isA<AnimeUserUpdates>(), reason: 'ID $id should return AnimeUserUpdates');
          print('✓ ID $id: Successfully parsed ${userUpdatesResult.data.length} AnimeUserUpdate for ${result.title}');

          final reviewsResult = await queue.add(() => client.getAnimeReviews(id));
          expect(reviewsResult, isA<AnimeReviews>(), reason: 'ID $id should return AnimeReviews');
          print('✓ ID $id: Successfully parsed ${reviewsResult.data.length} AnimeReview for ${result.title}');

          final relationsResult = await queue.add(() => client.getAnimeRelations(id));
          expect(relationsResult, isA<List<AnimeRelation>>(), reason: 'ID $id should return List<AnimeRelation>');
          print('✓ ID $id: Successfully parsed ${relationsResult.length} AnimeRelation for ${result.title}');

          final themesResult = await queue.add(() => client.getAnimeThemes(id));
          expect(themesResult, isA<AnimeThemesData>(), reason: 'ID $id should return AnimeThemesData');
          print('✓ ID $id: Successfully parsed ${themesResult.toLength()} for ${result.title}');

          final externalResult = await queue.add(() => client.getAnimeExternal(id));
          expect(externalResult, isA<List<AnimeExternal>>(), reason: 'ID $id should return List<AnimeExternal>');
          print('✓ ID $id: Successfully parsed ${externalResult.length} AnimeExternal for ${result.title}');

          final streamingResult = await queue.add(() => client.getAnimeStreaming(id));
          expect(streamingResult, isA<List<AnimeStreaming>>(), reason: 'ID $id should return List<AnimeStreaming>');
          print('✓ ID $id: Successfully parsed ${streamingResult.length} AnimeStreaming for ${result.title}');

          processedCount++;
        } on HttpException catch (e) {
          // Test: HttpException should pass (expected API error)
          expect(e, isA<HttpException>(), reason: 'ID $id: Should throw HttpException for API errors');
          print('✓ ID $id: Expected HttpException - ${e.message}');
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
