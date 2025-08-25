import 'dart:convert';

import 'top/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<TopAnimeResponse> getTopAnime(
  JikanClient client, {
  String? type,
  String? filter,
  String? rating,
  bool? sfw,
  int page = 1,
  int limit = 25,
}) async {
  try {
    final queryParams = <String, String>{};

    if (type != null) queryParams['type'] = type;
    if (filter != null) queryParams['filter'] = filter;
    if (rating != null) queryParams['rating'] = rating;
    if (sfw != null) queryParams['sfw'] = sfw.toString();
    queryParams['page'] = page.toString();
    queryParams['limit'] = limit.toString();

    final uri = Uri.parse('${client.jikanV4BaseUrl}/top/anime').replace(queryParameters: queryParams);
    final response = await client.httpClient.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return TopAnimeResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getTopAnime: $trace');
    }
    rethrow;
  }
}
