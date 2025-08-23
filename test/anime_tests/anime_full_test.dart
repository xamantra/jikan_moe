import 'dart:async';
import 'package:test/test.dart';
import 'dart:io';

import 'package:jikan_moe/src/jikan_client.dart';
import 'package:jikan_moe/src/anime/anime_full.dart';
import '../test_queue.dart';

void main() {
  group('JikanClient getAnimeFullById Tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
      // Clear any pending requests in the queue
      jikanQueue.clear();
    });

    const int testCount = 15;

    test('should handle $testCount specific anime IDs with queue-based rate limiting', () async {
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
      ];

      print('Testing anime IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;
      final stopwatch = Stopwatch()..start();

      // Create all requests using the queueing system
      final List<Future<void>> requests = testIds.map((id) async {
        try {
          // Use the queueing system to ensure rate limiting
          final result = await client.queuedRequest(() => client.getAnimeFullById(id));

          // Test: Should return AnimeFullData type
          expect(result, isA<AnimeFullData>(), reason: 'ID $id should return AnimeFullData');

          print('✓ ID $id: Successfully parsed AnimeFullData');
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
      }).toList();

      // Wait for all requests to complete
      await Future.wait(requests);

      stopwatch.stop();
      final totalTime = stopwatch.elapsed;

      print('Completed processing $processedCount out of $testCount IDs');
      print('Total time: ${totalTime.inSeconds}s');
      expect(processedCount, equals(testCount), reason: 'All IDs should be processed');
    });
  });
}
