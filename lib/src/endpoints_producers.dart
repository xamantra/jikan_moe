import 'dart:convert';

import 'producers/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

// getProducerFullById -> {{baseUrl}}/producers/:id/full
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