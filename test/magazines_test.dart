import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all magazines endpoints.
void main() {
  group('JikanClient magazines tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle magazines search', () async {
      final result = await queue.add(
        () => client.getMagazines(),
      );
      expect(result, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${result.data.length} magazines');

      final withPage = await queue.add(() => client.getMagazines(page: 2));
      expect(withPage, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withPage.data.length} magazines for <page: 2>');

      final withLimit = await queue.add(() => client.getMagazines(limit: 10));
      expect(withLimit, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withLimit.data.length} magazines for <limit: 10>');

      final withQuery = await queue.add(() => client.getMagazines(q: 'comic'));
      expect(withQuery, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withQuery.data.length} magazines for <q: comic>');

      final withOrderBy = await queue.add(() => client.getMagazines(orderBy: 'name'));
      expect(withOrderBy, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withOrderBy.data.length} magazines for <orderBy: name>');

      final withSort = await queue.add(() => client.getMagazines(sort: 'desc'));
      expect(withSort, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withSort.data.length} magazines for <sort: desc>');

      final withLetter = await queue.add(() => client.getMagazines(letter: 'B'));
      expect(withLetter, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${withLetter.data.length} magazines for <letter: B>');

      final combined = await queue.add(
        () => client.getMagazines(
          page: 1,
          limit: 5,
          orderBy: 'count',
          sort: 'desc',
        ),
      );
      expect(combined, isA<MagazinesResponse>(), reason: 'should return MagazinesResponse');
      print('✓ MagazinesResponse: Successfully parsed ${combined.data.length} magazines for combined parameters');
    });
  });
}
