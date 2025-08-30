import 'dart:convert';

import 'jikan_client.dart';
import 'reviews/reviews_recent_anime.dart';

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
