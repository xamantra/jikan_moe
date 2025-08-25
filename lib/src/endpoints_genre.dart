import 'dart:convert';

import 'genre/index.dart';
import 'jikan_client.dart';

Future<List<AnimeGenreData>> getAnimeGenres(
  JikanClient client, {
  String? filter,
}) async {
  final queryParams = <String, String>{};
  if (filter != null) {
    queryParams['filter'] = filter;
  }

  final uri = Uri.parse('${client.jikanV4BaseUrl}/genres/anime').replace(queryParameters: queryParams.isNotEmpty ? queryParams : null);

  final response = await client.httpClient.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final responseData = AnimeGenresResponse.fromJson(json);
    return responseData.data;
  } else {
    throw Exception('Failed to load anime genres: ${response.statusCode}');
  }
}

Future<List<MangaGenreData>> getMangaGenres(
  JikanClient client, {
  String? filter,
}) async {
  final queryParams = <String, String>{};
  if (filter != null) {
    queryParams['filter'] = filter;
  }

  final uri = Uri.parse('${client.jikanV4BaseUrl}/genres/manga').replace(queryParameters: queryParams.isNotEmpty ? queryParams : null);

  final response = await client.httpClient.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final responseData = MangaGenresResponse.fromJson(json);
    return responseData.data;
  } else {
    throw Exception('Failed to load manga genres: ${response.statusCode}');
  }
}
