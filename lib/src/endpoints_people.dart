import 'dart:convert';

import 'people/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

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

Future<PersonData> getPersonById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return PersonData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonById: $trace');
    }
    rethrow;
  }
}

Future<List<PersonAnimeEntry>> getPersonAnime(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id/anime'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final personAnimeResponse = PersonAnimeResponse.fromJson(jsonData);
      return personAnimeResponse.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonAnime: $trace');
    }
    rethrow;
  }
}

Future<List<PersonMangaEntry>> getPersonManga(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id/manga'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final personMangaResponse = PersonMangaResponse.fromJson(jsonData);
      return personMangaResponse.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonManga: $trace');
    }
    rethrow;
  }
}

Future<List<PersonVoiceEntry>> getPersonVoices(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id/voices'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final personVoicesResponse = PersonVoicesResponse.fromJson(jsonData);
      return personVoicesResponse.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonVoices: $trace');
    }
    rethrow;
  }
}

Future<List<PersonPicturesData>> getPersonPictures(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/people/$id/pictures'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final personPicturesResponse = PersonPicturesResponse.fromJson(jsonData);
      return personPicturesResponse.data;
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getPersonPictures: $trace');
    }
    rethrow;
  }
}