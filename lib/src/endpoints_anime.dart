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

Future<List<AnimeStaff>> getAnimeStaff(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/staff'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeStaffResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeStaff: $trace');
    }
    rethrow;
  }
}

Future<AnimeEpisodes> getAnimeEpisodes(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/episodes?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeEpisodes.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeEpisodes: $trace');
    }
    rethrow;
  }
}

Future<AnimeEpisode> getAnimeEpisodeById(JikanClient client, int id, {required int episode}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/episodes/$episode'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeEpisode.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeEpisodeById: $trace');
    }
    rethrow;
  }
}

Future<AnimeNews> getAnimeNews(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/news?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeNews.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeNews: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeForumTopic>> getAnimeForum(JikanClient client, int id, {String filter = "all"}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/forum?filter=$filter'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeForum.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeForum: $trace');
    }
    rethrow;
  }
}

Future<AnimeVideosData> getAnimeVideos(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/videos'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeVideos.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeVideos: $trace');
    }
    rethrow;
  }
}

Future<AnimeVideosEpisodes> getAnimeVideosEpisodes(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/videos/episodes?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeVideosEpisodes.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeVideosEpisodes: $trace');
    }
    rethrow;
  }
}

Future<List<AnimePicturesData>> getAnimePictures(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/pictures'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimePicturesResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimePictures: $trace');
    }
    rethrow;
  }
}

Future<AnimeStatisticsData> getAnimeStatistics(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/statistics'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeStatistics.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeStatistics: $trace');
    }
    rethrow;
  }
}

Future<AnimeMoreInfoData> getAnimeMoreInfo(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/moreinfo'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeMoreInfo.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeMoreInfo: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeRecommendation>> getAnimeRecommendations(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/recommendations'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeRecommendations.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeRecommendations: $trace');
    }
    rethrow;
  }
}

Future<AnimeUserUpdates> getAnimeUserUpdates(JikanClient client, int id, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/userupdates?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeUserUpdates.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeUserUpdates: $trace');
    }
    rethrow;
  }
}

Future<AnimeReviews> getAnimeReviews(JikanClient client, int id, {int page = 1, bool preliminary = true, bool spoilers = false}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/reviews?page=$page&preliminary=$preliminary&spoilers=$spoilers'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeReviews.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeReviews: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeRelation>> getAnimeRelations(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/relations'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeRelations.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeRelations: $trace');
    }
    rethrow;
  }
}

Future<AnimeThemesData> getAnimeThemes(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/themes'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeThemes.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeThemes: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeExternal>> getAnimeExternal(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/external'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeExternalResult.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeExternal: $trace');
    }
    rethrow;
  }
}

Future<List<AnimeStreaming>> getAnimeStreaming(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/streaming'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeStreamingResult.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeStreaming: $trace');
    }
    rethrow;
  }
}

Future<AnimeSearchResponse> getAnimeSearch(
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
  String? rating,
  bool? sfw = true,
  String? genres,
  String? genresExclude,
  String? orderBy,
  String? sort,
  String? letter,
  String? producers,
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
      if (rating != null) 'rating': rating,
      if (sfw != null) 'sfw': sfw.toString(),
      if (genres != null) 'genres': genres,
      if (genresExclude != null) 'genres_exclude': genresExclude,
      if (orderBy != null) 'order_by': orderBy,
      if (sort != null) 'sort': sort,
      if (letter != null) 'letter': letter,
      if (producers != null) 'producers': producers,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    };
    var encodedQueryParams = Uri(queryParameters: queryParams).query;
    if (unapproved) {
      encodedQueryParams += 'unapproved&$encodedQueryParams';
    }
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime?$encodedQueryParams'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeSearchResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeSearch: $trace');
    }
    rethrow;
  }
}
