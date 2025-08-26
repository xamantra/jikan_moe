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

    test('should handle watch recent episodes', () async {
      final result = await queue.add(
        () => client.getWatchRecentEpisodes(),
      );
      
      expect(result, isA<WatchRecentEpisodesResponse>(), reason: 'should return WatchRecentEpisodesResponse');
      print('✓ WatchRecentEpisodesResponse: Successfully parsed ${result.data.length} recent episodes');
    });
  });
}
