import 'dart:convert';
import 'dart:io';

import 'jikan_client.dart';
import 'manga/index.dart';

Future<MangaData> getMangaById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaDataResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaById: $trace');
    }
    rethrow;
  }
}

Future<MangaFullData> getMangaFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaFullResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaFullById: $trace');
    }
    rethrow;
  }
}

Future<List<MangaCharacter>> getMangaCharacters(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/characters'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaCharactersResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaCharacters: $trace');
    }
    rethrow;
  }
}

// TODO //
// {{baseUrl}}/manga/:id/reviews?page=1&preliminary=true&spoilers=false
// {{baseUrl}}/manga/:id/relations
// {{baseUrl}}/manga/:id/external

// ADD NEW METHODS IN BOTTOM //

Future<MangaNews> getMangaNews(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/news?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaNews.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaNews: $trace');
    }
    rethrow;
  }
}

Future<List<MangaForumTopic>> getMangaTopics(JikanClient client, int id, {String filter = "all"}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/forum?filter=$filter'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaForum.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaTopics: $trace');
    }
    rethrow;
  }
}

Future<List<MangaImages>> getMangaPictures(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/pictures'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaPicturesResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaPictures: $trace');
    }
    rethrow;
  }
}

Future<MangaStatisticsData> getMangaStatistics(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/statistics'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaStatistics.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaStatistics: $trace');
    }
    rethrow;
  }
}

Future<MangaMoreInfoData> getMangaMoreInfo(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/moreinfo'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaMoreInfoResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaMoreInfo: $trace');
    }
    rethrow;
  }
}

Future<List<MangaRecommendation>> getMangaRecommendations(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/recommendations'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaRecommendations.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaRecommendations: $trace');
    }
    rethrow;
  }
}

Future<MangaUserUpdates> getMangaUserUpdates(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/userupdates?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaUserUpdates.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaUserUpdates: $trace');
    }
    rethrow;
  }
}
