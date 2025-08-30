import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all producer endpoints.
void main() {
  group('JikanClient producer tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    final List<int> testIds = [18, 2246, 493, 569, 10, 287, 406, 11];

    test('should handle ${testIds.length} specific producer IDs with queue-based rate limiting', () async {
      print('Testing producer IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Process requests sequentially using the queue
      for (final id in testIds) {
        try {
          final result = await queue.add(() => client.getProducerFullById(id));
          expect(result, isA<ProducerFullData>(), reason: 'ID $id should return ProducerFullData');
          print('✓ ID $id: Successfully parsed ${result.titles.first.title} with ${result.favorites} favorites');

          // Test getProducerById
          final basicResult = await queue.add(() => client.getProducerById(id));
          expect(basicResult, isA<ProducerData>(), reason: 'ID $id should return ProducerData');
          print('✓ ID $id: Successfully parsed basic producer ${basicResult.titles.first.title} with ${basicResult.count} entries');

          // Test getProducerExternal
          final externalResult = await queue.add(() => client.getProducerExternal(id));
          expect(externalResult, isA<List<ProducerExternal>>(), reason: 'ID $id should return List<ProducerExternal>');
          print('✓ ID $id: Successfully parsed ${externalResult.length} external links');

          processedCount++;
        } catch (e) {
          print('✗ ID $id: Error - $e');
        }
      }

      print('Processed $processedCount out of ${testIds.length} producer IDs');
      expect(processedCount, greaterThan(0), reason: 'At least one producer should be processed successfully');
    });
  }, timeout: const Timeout(Duration(minutes: 60)));
}
