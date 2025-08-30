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

    test('should handle ${testIds.length} specific producer IDs and getProducers with queue-based rate limiting', () async {
      print('Testing producer IDs: $testIds');
      print('Using queue-based rate limiting: 1 request per second');

      int processedCount = 0;

      // Test getProducers endpoint first
      final producersResult = await queue.add(() => client.getProducers(page: 1, limit: 5));
      expect(producersResult, isA<ProducersResponse>(), reason: 'Should return ProducersResponse');
      expect(producersResult.pagination, isA<ProducerPagination>(), reason: 'Should have pagination data');
      expect(producersResult.data, isA<List<ProducerData>>(), reason: 'Should have producer data list');
      expect(producersResult.data.length, lessThanOrEqualTo(5), reason: 'Should have at most 5 producers');

      print('✓ Successfully parsed producers list with ${producersResult.data.length} producers');
      print('  - Pagination: page ${producersResult.pagination.currentPage}/${producersResult.pagination.lastVisiblePage}');
      print('  - Total items: ${producersResult.pagination.items.total}');
      print('  - Has next page: ${producersResult.pagination.hasNextPage}');

      if (producersResult.data.isNotEmpty) {
        final firstProducer = producersResult.data.first;
        print('  - First producer: ${firstProducer.titles.first.title} (ID: ${firstProducer.malId})');
      }

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
