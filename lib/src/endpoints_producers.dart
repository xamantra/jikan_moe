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