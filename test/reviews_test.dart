import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all reviews endpoints.
void main() {
  group('JikanClient reviews tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle recent anime reviews', () async {
      final result = await queue.add(
        () => client.getRecentAnimeReviews(),
      );
      expect(result, isA<ReviewsRecentAnimeResponse>(), reason: 'should return ReviewsRecentAnimeResponse');
      print('✓ ReviewsRecentAnimeResponse: Successfully parsed ${result.data.length} reviews');

      final withPreliminary = await queue.add(() => client.getRecentAnimeReviews(preliminary: true));
      expect(withPreliminary, isA<ReviewsRecentAnimeResponse>(), reason: 'should return ReviewsRecentAnimeResponse');
      print('✓ ReviewsRecentAnimeResponse: Successfully parsed ${withPreliminary.data.length} reviews with preliminary=true');

      final withSpoilers = await queue.add(() => client.getRecentAnimeReviews(spoilers: true));
      expect(withSpoilers, isA<ReviewsRecentAnimeResponse>(), reason: 'should return ReviewsRecentAnimeResponse');
      print('✓ ReviewsRecentAnimeResponse: Successfully parsed ${withSpoilers.data.length} reviews with spoilers=true');

      final page2 = await queue.add(() => client.getRecentAnimeReviews(page: 2));
      expect(page2, isA<ReviewsRecentAnimeResponse>(), reason: 'should return ReviewsRecentAnimeResponse');
      print('✓ ReviewsRecentAnimeResponse: Successfully parsed ${page2.data.length} reviews from page 2');
    });
  }, timeout: const Timeout(Duration(minutes: 10)));
}
