import 'dart:convert';

import 'schedules/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<SchedulesResponse> getSchedules(
  JikanClient client, {
  String? filter,
  bool? kids,
  bool? sfw,
  bool? unapproved,
  int? page,
  int? limit,
}) async {
  try {
    final queryParams = <String, String>{};

    if (filter != null) queryParams['filter'] = filter;
    if (kids != null) queryParams['kids'] = kids.toString();
    if (sfw != null) queryParams['sfw'] = sfw.toString();
    if (unapproved != null) queryParams['unapproved'] = unapproved.toString();
    if (page != null) queryParams['page'] = page.toString();
    if (limit != null) queryParams['limit'] = limit.toString();

    final uri = Uri.parse('${client.jikanV4BaseUrl}/schedules').replace(queryParameters: queryParams);
    final response = await client.httpClient.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SchedulesResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getSchedules: $trace');
    }
    rethrow;
  }
}
