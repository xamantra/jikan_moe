import 'dart:convert';

import 'characters/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<CharacterFullData> getCharacterFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return CharacterFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
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

Future<CharacterData> getCharacterById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return CharacterData.fromJson(jsonData['data'] as Map<String, dynamic>);
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

Future<List<CharacterAnimeData>> getCharacterAnime(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id/anime'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final responseData = CharacterAnimeResponse.fromJson(jsonData);
      return responseData.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getCharacterAnime: $trace');
    }
    rethrow;
  }
}

Future<List<CharacterMangaData>> getCharacterManga(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id/manga'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final responseData = CharacterMangaResponse.fromJson(jsonData);
      return responseData.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getCharacterManga: $trace');
    }
    rethrow;
  }
}

Future<List<CharacterVoiceData>> getCharacterVoices(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/characters/$id/voices'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final responseData = CharacterVoicesResponse.fromJson(jsonData);
      return responseData.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getCharacterVoices: $trace');
    }
    rethrow;
  }
}