import 'dart:convert';

import 'producers/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<ProducerFullData> getProducerFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/producers/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProducerFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getProducerFullById: $trace');
    }
    rethrow;
  }
}

Future<ProducerData> getProducerById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/producers/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProducerData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getProducerById: $trace');
    }
    rethrow;
  }
}

Future<List<ProducerExternal>> getProducerExternal(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/producers/$id/external'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final responseData = ProducerExternalResponse.fromJson(jsonData);
      return responseData.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getProducerExternal: $trace');
    }
    rethrow;
  }
}

Future<ProducersResponse> getProducers(
  JikanClient client, {
  int? page,
  int? limit,
  String? q,
  String? orderBy,
  String? sort,
  String? letter,
}) async {
  try {
    final queryParams = <String, String>{};
    if (page != null) queryParams['page'] = page.toString();
    if (limit != null) queryParams['limit'] = limit.toString();
    if (q != null) queryParams['q'] = q;
    if (orderBy != null) queryParams['order_by'] = orderBy;
    if (sort != null) queryParams['sort'] = sort;
    if (letter != null) queryParams['letter'] = letter;

    final uri = Uri.parse('${client.jikanV4BaseUrl}/producers').replace(queryParameters: queryParams.isNotEmpty ? queryParams : null);
    final response = await client.httpClient.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProducersResponse.fromJson(jsonData);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getProducers: $trace');
    }
    rethrow;
  }
}

// getProducers -> {{baseUrl}}/producers
// page
// limit (max 25)
// q
// order_by ("mal_id" "count" "favorites" "established")
// sort ("desc" "asc")
// letter -> Return entries starting with the given letter
