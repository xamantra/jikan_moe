import 'dart:convert';

import 'people/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

// getPersonFullById -> {{baseUrl}}/people/:id/full
Future<PersonFullData> getPersonFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return PersonFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonFullById: $trace');
    }
    rethrow;
  }
}