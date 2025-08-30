import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all recommendations endpoints.
void main() {
  group('JikanClient recommendations tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle recent anime recommendations', () async {
      final result = await queue.add(() => client.getRecentAnimeRecommendations());
      expect(result, isA<RecommendationsRecentAnimeResponse>(), reason: 'should return RecommendationsRecentAnimeResponse');
      print('✓ RecommendationsRecentAnimeResponse: Successfully parsed ${result.data.length} recommendations');

      final page2 = await queue.add(() => client.getRecentAnimeRecommendations(page: 2));
      expect(page2, isA<RecommendationsRecentAnimeResponse>(), reason: 'should return RecommendationsRecentAnimeResponse');
      print('✓ RecommendationsRecentAnimeResponse: Successfully parsed ${page2.data.length} recommendations for page 2');
    });
  });
}
