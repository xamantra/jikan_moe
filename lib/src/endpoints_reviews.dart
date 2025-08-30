import 'dart:convert';

import 'jikan_client.dart';
import 'reviews/reviews_recent_anime.dart';
import 'reviews/reviews_recent_manga.dart';

Future<ReviewsRecentAnimeResponse> getRecentAnimeReviews(
  JikanClient client, {
  int page = 1,
  bool preliminary = true,
  bool spoilers = false,
}) async {
  final queryParams = <String, String>{
    'page': page.toString(),
    'preliminary': preliminary.toString(),
    'spoilers': spoilers.toString(),
  };

  final uri = Uri.parse('${client.jikanV4BaseUrl}/reviews/anime').replace(queryParameters: queryParams);

  final response = await client.httpClient.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ReviewsRecentAnimeResponse.fromJson(json);
  } else {
    throw Exception('Failed to load recent anime reviews: ${response.statusCode}');
  }
}

Future<ReviewsRecentMangaResponse> getRecentMangaReviews(
  JikanClient client, {
  int page = 1,
  bool preliminary = true,
  bool spoilers = false,
}) async {
  final queryParams = <String, String>{
    'page': page.toString(),
    'preliminary': preliminary.toString(),
    'spoilers': spoilers.toString(),
  };

  final uri = Uri.parse('${client.jikanV4BaseUrl}/reviews/manga').replace(queryParameters: queryParams);

  final response = await client.httpClient.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ReviewsRecentMangaResponse.fromJson(json);
  } else {
    throw Exception('Failed to load recent manga reviews: ${response.statusCode}');
  }
}

// getRecentMangaReviews -> {{baseUrl}}/reviews/manga?page=1&preliminary=true&spoilers=true
// page
// preliminary -> Any reviews left during an ongoing anime/manga, those reviews are tagged as preliminary. NOTE: Preliminary reviews are not returned by default so if the entry is airing/publishing you need to add this otherwise you will get an empty list.
// spoilers -> Any reviews that are tagged as a spoiler. Spoiler reviews are not returned by default.