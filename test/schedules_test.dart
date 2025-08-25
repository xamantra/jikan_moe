import 'package:jikan_moe/jikan_moe.dart';
import 'package:test/test.dart';

import 'queue.dart';

/// This test should cover all schedules endpoints.
void main() {
  group('JikanClient schedules tests', () {
    late JikanClient client;

    setUp(() {
      client = JikanClient();
    });

    tearDown(() {
      client.httpClient.close();
    });

    test('should handle schedules with different filters', () async {
      final friday = await queue.add(() => client.getSchedules(filter: 'friday'));
      expect(friday, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${friday.data.length} schedules for <filter: friday>');

      final monday = await queue.add(() => client.getSchedules(filter: 'monday'));
      expect(monday, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${monday.data.length} schedules for <filter: monday>');

      final kids = await queue.add(() => client.getSchedules(kids: true));
      expect(kids, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${kids.data.length} schedules for <kids: true>');

      final sfw = await queue.add(() => client.getSchedules(sfw: false));
      expect(sfw, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${sfw.data.length} schedules for <sfw: false>');

      final page = await queue.add(() => client.getSchedules(page: 2));
      expect(page, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${page.data.length} schedules for <page: 2>');

      final limit = await queue.add(() => client.getSchedules(limit: 10));
      expect(limit, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${limit.data.length} schedules for <limit: 10>');

      final combined = await queue.add(() => client.getSchedules(
        filter: 'friday',
        kids: false,
        sfw: true,
        page: 1,
        limit: 5,
      ));
      expect(combined, isA<SchedulesResponse>(), reason: 'should return SchedulesResponse');
      print('✓ SchedulesResponse: Successfully parsed ${combined.data.length} schedules for combined filters');
    });
  });
}
