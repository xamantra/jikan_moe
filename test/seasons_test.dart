import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all seasons endpoints.
void main() {
  group('JikanClient seasons tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle season now', () async {
      final result = await queue.add(() => client.getSeasonNow());
      expect(result, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${result.data.length} anime for current season');

      final tvFilter = await queue.add(() => client.getSeasonNow(filter: 'tv'));
      expect(tvFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${tvFilter.data.length} TV anime for current season');

      final movieFilter = await queue.add(() => client.getSeasonNow(filter: 'movie'));
      expect(movieFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${movieFilter.data.length} movie anime for current season');

      final ovaFilter = await queue.add(() => client.getSeasonNow(filter: 'ova'));
      expect(ovaFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${ovaFilter.data.length} OVA anime for current season');

      final specialFilter = await queue.add(() => client.getSeasonNow(filter: 'special'));
      expect(specialFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${specialFilter.data.length} special anime for current season');

      final onaFilter = await queue.add(() => client.getSeasonNow(filter: 'ona'));
      expect(onaFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${onaFilter.data.length} ONA anime for current season');

      final musicFilter = await queue.add(() => client.getSeasonNow(filter: 'music'));
      expect(musicFilter, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${musicFilter.data.length} music anime for current season');

      final sfw = await queue.add(() => client.getSeasonNow(sfw: true));
      expect(sfw, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${sfw.data.length} SFW anime for current season');

      final continuing = await queue.add(() => client.getSeasonNow(continuing: true));
      expect(continuing, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${continuing.data.length} continuing anime for current season');

      final page2 = await queue.add(() => client.getSeasonNow(page: 2));
      expect(page2, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${page2.data.length} anime for current season (page 2)');

      final limit10 = await queue.add(() => client.getSeasonNow(limit: 10));
      expect(limit10, isA<SeasonNowResponse>(), reason: 'should return SeasonNowResponse');
      print('✓ SeasonNowResponse: Successfully parsed ${limit10.data.length} anime for current season (limit 10)');
    });
  });
}
