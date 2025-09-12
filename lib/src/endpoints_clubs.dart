import 'dart:convert';

import 'clubs/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<ClubsSearchResponse> getClubsSearch(
  JikanClient client, {
  int? page,
  int? limit,
  String? q,
  String? type,
  String? category,
  String? orderBy,
  String? sort,
  String? letter,
}) async {
  try {
    final queryParams = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      if (q != null) 'q': q,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (orderBy != null) 'order_by': orderBy,
      if (sort != null) 'sort': sort,
      if (letter != null) 'letter': letter,
    };
    final encodedQueryParams = Uri(queryParameters: queryParams).query;
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/clubs?$encodedQueryParams'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ClubsSearchResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getClubsSearch: $trace');
    }
    rethrow;
  }
}

Future<ClubsDataResponse> getClubsById(
  JikanClient client,
  int id,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/clubs/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ClubsDataResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getClubsById: $trace');
    }
    rethrow;
  }
}

Future<ClubsMembersResponse> getClubMembers(
  JikanClient client,
  int id, {
  int? page,
}) async {
  try {
    final queryParams = <String, String>{
      if (page != null) 'page': page.toString(),
    };
    final encodedQueryParams = Uri(queryParameters: queryParams).query;
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/clubs/$id/members?$encodedQueryParams'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ClubsMembersResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getClubMembers: $trace');
    }
    rethrow;
  }
}

Future<ClubsStaffResponse> getClubStaff(
  JikanClient client,
  int id,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/clubs/$id/staff'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ClubsStaffResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getClubStaff: $trace');
    }
    rethrow;
  }
}