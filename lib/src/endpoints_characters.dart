import 'dart:convert';

import 'characters/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<CharactersFullData> getCharacterFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return CharactersFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getCharacterFullById: $trace');
    }
    rethrow;
  }
}

// getCharacterById -> {{baseUrl}}/characters/:id
Future<CharactersData> getCharacterById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return CharactersData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getCharacterById: $trace');
    }
    rethrow;
  }
}
