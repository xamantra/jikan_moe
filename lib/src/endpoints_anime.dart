import 'dart:convert';
import 'dart:io';

import 'anime/index.dart';
import 'jikan_client.dart';

Future<AnimeFullData> getAnimeFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeFullById: $trace');
    }
    rethrow;
  }
}

Future<AnimeData> getAnimeById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeById: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeCharacter>> getAnimeCharacters(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/characters'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeCharactersResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeCharacters: $trace');
    }
    rethrow;
  }
}
