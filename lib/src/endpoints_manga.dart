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

Future<MangaReviews> getMangaReviews(JikanClient client, int id, {int page = 1, bool preliminary = true, bool spoilers = false}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/reviews?page=$page&preliminary=$preliminary&spoilers=$spoilers'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaReviews.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaReviews: $trace');
    }
    rethrow;
  }
}

Future<List<MangaRelation>> getMangaRelations(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/relations'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaRelationsResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaRelations: $trace');
    }
    rethrow;
  }
}

Future<List<MangaExternal>> getMangaExternal(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/external'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaExternalResult.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaExternal: $trace');
    }
    rethrow;
  }
}

Future<MangaSearchResponse> getMangaSearch(
  JikanClient client, {
  bool unapproved = false,
  int? page = 1,
  int? limit = 25,
  String? q,
  String? type,
  double? score,
  double? minScore,
  double? maxScore,
  String? status,
  bool? sfw = true,
  String? genres,
  String? genresExclude,
  String? orderBy,
  String? sort,
  String? letter,
  String? magazines,
  String? startDate,
  String? endDate,
}) async {
  try {
    final queryParams = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      if (q != null) 'q': q,
      if (type != null) 'type': type,
      if (score != null) 'score': score.toString(),
      if (minScore != null) 'min_score': minScore.toString(),
      if (maxScore != null) 'max_score': maxScore.toString(),
      if (status != null) 'status': status,
      if (sfw != null) 'sfw': sfw.toString(),
      if (genres != null) 'genres': genres,
      if (genresExclude != null) 'genres_exclude': genresExclude,
      if (orderBy != null) 'order_by': orderBy,
      if (sort != null) 'sort': sort,
      if (letter != null) 'letter': letter,
      if (magazines != null) 'magazines': magazines,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    };
    var encodedQueryParams = Uri(queryParameters: queryParams).query;
    if (unapproved) {
      encodedQueryParams += 'unapproved&$encodedQueryParams';
    }
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga?$encodedQueryParams'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaSearchResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaSearch: $trace');
    }
    rethrow;
  }
}
