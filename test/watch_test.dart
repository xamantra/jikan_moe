import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all watch endpoints.
void main() {
  group('JikanClient watch tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle watch endpoints', () async {
      // Test recent episodes
      final recentResult = await queue.add(() => client.getWatchRecentEpisodes());
      expect(recentResult, isA<WatchEpisodesResponse>(), reason: 'should return WatchEpisodesResponse');
      print('✓ WatchEpisodesResponse: Successfully parsed ${recentResult.data.length} recent episodes');

      // Test popular episodes
      final popularResult = await queue.add(() => client.getWatchPopularEpisodes());
      expect(popularResult, isA<WatchEpisodesResponse>(), reason: 'should return WatchEpisodesResponse');
      print('✓ WatchEpisodesResponse: Successfully parsed ${popularResult.data.length} popular episodes');
    });
  });
}
