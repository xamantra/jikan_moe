import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all random endpoints.
void main() {
  group('JikanClient random tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle random anime', () async {
      for (int i = 1; i <= 10; i++) {
        final random = await queue.add(() => client.getRandomAnime());
        expect(random, isA<AnimeData>(), reason: 'should return AnimeData');
        print('✓ RandomAnime $i: Successfully parsed ${random.title}');
      }
    });
  }, timeout: Timeout(Duration(minutes: 60)));
}
