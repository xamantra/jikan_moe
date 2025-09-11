import 'dart:convert';

import 'users/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<UsersSearchResponse> getUsersSearch(
  JikanClient client, {
  int? page,
  int? limit,
  String? q,
  String? gender,
  String? location,
  int? maxAge,
  int? minAge,
}) async {
  try {
    final queryParams = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      if (q != null) 'q': q,
      if (gender != null) 'gender': gender,
      if (location != null) 'location': location,
      if (maxAge != null) 'max_age': maxAge.toString(),
      if (minAge != null) 'min_age': minAge.toString(),
    };
    final encodedQueryParams = Uri(queryParameters: queryParams).query;
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users?$encodedQueryParams'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersSearchResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUsersSearch: $trace');
    }
    rethrow;
  }
}

Future<UsersFullResponse> getUserFullProfile(
  JikanClient client,
  String username,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/$username/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersFullResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserFullProfile: $trace');
    }
    rethrow;
  }
}

Future<UsersIdResponse> getUserById(
  JikanClient client,
  int id,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/userbyid/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersIdResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserById: $trace');
    }
    rethrow;
  }
}

Future<UsersProfileResponse> getUserProfile(
  JikanClient client,
  String username,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/$username'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersProfileResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserProfile: $trace');
    }
    rethrow;
  }
}

Future<UsersStatisticsResponse> getUserStatistics(
  JikanClient client,
  String username,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/$username/statistics'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersStatisticsResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserStatistics: $trace');
    }
    rethrow;
  }
}

Future<UsersFavoritesResponse> getUserFavorites(
  JikanClient client,
  String username,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/$username/favorites'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersFavoritesResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserFavorites: $trace');
    }
    rethrow;
  }
}

Future<UsersUpdatesResponse> getUserUpdates(
  JikanClient client,
  String username,
) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/users/$username/userupdates'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UsersUpdatesResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getUserUpdates: $trace');
    }
    rethrow;
  }
}