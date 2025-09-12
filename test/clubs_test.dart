import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all clubs endpoints.
void main() {
  group('JikanClient clubs tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle clubs search', () async {
      final result = await queue.add(
        () => client.getClubsSearch(q: 'anime'),
      );
      expect(result, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${result.data.length} ClubsSearch for <q: anime>');

      final typePublic = await queue.add(() => client.getClubsSearch(type: 'public'));
      expect(typePublic, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${typePublic.data.length} ClubsSearch for <type: public>');

      final categoryAnime = await queue.add(() => client.getClubsSearch(category: 'anime'));
      expect(categoryAnime, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${categoryAnime.data.length} ClubsSearch for <category: anime>');

      final orderByName = await queue.add(() => client.getClubsSearch(orderBy: 'name'));
      expect(orderByName, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${orderByName.data.length} ClubsSearch for <orderBy: name>');

      final sortDesc = await queue.add(() => client.getClubsSearch(sort: 'desc'));
      expect(sortDesc, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${sortDesc.data.length} ClubsSearch for <sort: desc>');

      final letterA = await queue.add(() => client.getClubsSearch(letter: 'a'));
      expect(letterA, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${letterA.data.length} ClubsSearch for <letter: a>');

      final pageLimit = await queue.add(() => client.getClubsSearch(page: 1, limit: 10));
      expect(pageLimit, isA<ClubsSearchResponse>(), reason: 'should return ClubsSearchResponse');
      print('✓ ClubsSearchResponse: Successfully parsed ${pageLimit.data.length} ClubsSearch for <page: 1, limit: 10>');

      // pick random club item from result above
      final randomClub = result.data.isNotEmpty ? (result.data..shuffle()).first : null;
      if (randomClub != null) {
        final clubById = await queue.add(() => client.getClubsById(randomClub.malId));
        expect(clubById, isA<ClubsDataResponse>(), reason: 'should return ClubsDataResponse');
        print('✓ ClubsDataResponse: Successfully parsed club data for ID ${randomClub.malId}');
      }
    });
  });
}
