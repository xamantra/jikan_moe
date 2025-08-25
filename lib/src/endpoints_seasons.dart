import 'dart:convert';

import 'seasons/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<SeasonNowResponse> getSeasonNow(
  JikanClient client, {
  String? filter,
  bool? sfw,
  bool? unapproved,
  bool? continuing,
  int page = 1,
  int limit = 25,
}) async {
  try {
    final queryParams = <String, String>{};

    if (filter != null) queryParams['filter'] = filter;
    if (sfw != null) queryParams['sfw'] = sfw.toString();
    if (unapproved != null) queryParams['unapproved'] = unapproved.toString();
    if (continuing != null) queryParams['continuing'] = continuing.toString();
    queryParams['page'] = page.toString();
    queryParams['limit'] = limit.toString();

    final uri = Uri.parse('${client.jikanV4BaseUrl}/seasons/now').replace(queryParameters: queryParams);

    final response = await client.httpClient.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SeasonNowResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getSeasonNow: $trace');
    }
    rethrow;
  }
}

Future<SeasonGetResponse> getSeason(
  JikanClient client,
  int year,
  String season, {
  String? filter,
  bool? sfw,
  bool? unapproved,
  bool? continuing,
  int page = 1,
  int limit = 25,
}) async {
  try {
    final queryParams = <String, String>{};

    if (filter != null) queryParams['filter'] = filter;
    if (sfw != null) queryParams['sfw'] = sfw.toString();
    if (unapproved != null) queryParams['unapproved'] = unapproved.toString();
    if (continuing != null) queryParams['continuing'] = continuing.toString();
    queryParams['page'] = page.toString();
    queryParams['limit'] = limit.toString();

    final uri = Uri.parse('${client.jikanV4BaseUrl}/seasons/$year/$season').replace(queryParameters: queryParams);

    final response = await client.httpClient.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SeasonGetResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getSeason: $trace');
    }
    rethrow;
  }
}

Future<SeasonListResponse> getSeasonsList(
  JikanClient client,
) async {
  try {
    final uri = Uri.parse('${client.jikanV4BaseUrl}/seasons');

    final response = await client.httpClient.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SeasonListResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getSeasonsList: $trace');
    }
    rethrow;
  }
}

Future<SeasonUpcomingResponse> getSeasonUpcoming(
  JikanClient client, {
  String? filter,
  bool? sfw,
  bool? unapproved,
  bool? continuing,
  int page = 1,
  int limit = 25,
}) async {
  try {
    final queryParams = <String, String>{};

    if (filter != null) queryParams['filter'] = filter;
    if (sfw != null) queryParams['sfw'] = sfw.toString();
    if (unapproved != null) queryParams['unapproved'] = unapproved.toString();
    if (continuing != null) queryParams['continuing'] = continuing.toString();
    queryParams['page'] = page.toString();
    queryParams['limit'] = limit.toString();

    final uri = Uri.parse('${client.jikanV4BaseUrl}/seasons/upcoming').replace(queryParameters: queryParams);

    final response = await client.httpClient.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SeasonUpcomingResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getSeasonUpcoming: $trace');
    }
    rethrow;
  }
}