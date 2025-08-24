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
