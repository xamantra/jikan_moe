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

      final summer2025 = await queue.add(() => client.getSeason(2025, 'summer'));
      expect(summer2025, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${summer2025.data.length} anime for summer 2025');

      final winter2024 = await queue.add(() => client.getSeason(2024, 'winter'));
      expect(winter2024, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${winter2024.data.length} anime for winter 2024');

      final spring2024 = await queue.add(() => client.getSeason(2024, 'spring'));
      expect(spring2024, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${spring2024.data.length} anime for spring 2024');

      final fall2024 = await queue.add(() => client.getSeason(2024, 'fall'));
      expect(fall2024, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${fall2024.data.length} anime for fall 2024');

      final tvFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'tv'));
      expect(tvFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${tvFilterSeason.data.length} TV anime for summer 2025');

      final movieFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'movie'));
      expect(movieFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${movieFilterSeason.data.length} movie anime for summer 2025');

      final ovaFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'ova'));
      expect(ovaFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${ovaFilterSeason.data.length} OVA anime for summer 2025');

      final specialFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'special'));
      expect(specialFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${specialFilterSeason.data.length} special anime for summer 2025');

      final onaFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'ona'));
      expect(onaFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${onaFilterSeason.data.length} ONA anime for summer 2025');

      final musicFilterSeason = await queue.add(() => client.getSeason(2025, 'summer', filter: 'music'));
      expect(musicFilterSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${musicFilterSeason.data.length} music anime for summer 2025');

      final sfwSeason = await queue.add(() => client.getSeason(2025, 'summer', sfw: true));
      expect(sfwSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${sfwSeason.data.length} SFW anime for summer 2025');

      final continuingSeason = await queue.add(() => client.getSeason(2025, 'summer', continuing: true));
      expect(continuingSeason, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${continuingSeason.data.length} continuing anime for summer 2025');

      final page2Season = await queue.add(() => client.getSeason(2025, 'summer', page: 2));
      expect(page2Season, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${page2Season.data.length} anime for summer 2025 (page 2)');

      final limit10Season = await queue.add(() => client.getSeason(2025, 'summer', limit: 10));
      expect(limit10Season, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${limit10Season.data.length} anime for summer 2025 (limit 10)');

      final fall2025 = await queue.add(() => client.getSeason(2025, 'fall'));
      expect(fall2025, isA<SeasonGetResponse>(), reason: 'should return SeasonGetResponse');
      print('✓ SeasonGetResponse: Successfully parsed ${fall2025.data.length} anime for fall 2025');

      final upcoming = await queue.add(() => client.getSeasonUpcoming());
      expect(upcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${upcoming.data.length} upcoming anime');

      final tvFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'tv'));
      expect(tvFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${tvFilterUpcoming.data.length} TV upcoming anime');

      final movieFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'movie'));
      expect(movieFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${movieFilterUpcoming.data.length} movie upcoming anime');

      final ovaFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'ova'));
      expect(ovaFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${ovaFilterUpcoming.data.length} OVA upcoming anime');

      final specialFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'special'));
      expect(specialFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${specialFilterUpcoming.data.length} special upcoming anime');

      final onaFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'ona'));
      expect(onaFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${onaFilterUpcoming.data.length} ONA upcoming anime');

      final musicFilterUpcoming = await queue.add(() => client.getSeasonUpcoming(filter: 'music'));
      expect(musicFilterUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${musicFilterUpcoming.data.length} music upcoming anime');

      final sfwUpcoming = await queue.add(() => client.getSeasonUpcoming(sfw: true));
      expect(sfwUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${sfwUpcoming.data.length} SFW upcoming anime');

      final continuingUpcoming = await queue.add(() => client.getSeasonUpcoming(continuing: true));
      expect(continuingUpcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${continuingUpcoming.data.length} continuing upcoming anime');

      final page2Upcoming = await queue.add(() => client.getSeasonUpcoming(page: 2));
      expect(page2Upcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${page2Upcoming.data.length} upcoming anime (page 2)');

      final limit10Upcoming = await queue.add(() => client.getSeasonUpcoming(limit: 10));
      expect(limit10Upcoming, isA<SeasonUpcomingResponse>(), reason: 'should return SeasonUpcomingResponse');
      print('✓ SeasonUpcomingResponse: Successfully parsed ${limit10Upcoming.data.length} upcoming anime (limit 10)');

      final seasonsList = await queue.add(() => client.getSeasonsList());
      expect(seasonsList, isA<SeasonListResponse>(), reason: 'should return SeasonListResponse');
      print('✓ SeasonListResponse: Successfully parsed ${seasonsList.data.length} anime seasons');
      
      // Verify the structure of the response
      expect(seasonsList.pagination, isA<Pagination>(), reason: 'should have pagination');
      expect(seasonsList.data, isNotEmpty, reason: 'should have season data');
      
      // Verify a sample year has the expected structure
      final sampleYear = seasonsList.data.first;
      expect(sampleYear.year, isA<int>(), reason: 'year should be an integer');
      expect(sampleYear.seasons, isA<List<String>>(), reason: 'seasons should be a list of strings');
      expect(sampleYear.seasons, isNotEmpty, reason: 'seasons should not be empty');
      
      // Verify seasons contain valid values
      final validSeasons = ['winter', 'spring', 'summer', 'fall'];
      for (final season in sampleYear.seasons) {
        expect(validSeasons, contains(season), reason: 'season should be a valid season name');
      }
    });
  }, timeout: Timeout(Duration(minutes: 5)));
}
