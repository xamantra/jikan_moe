import 'dart:convert';

import 'recommendations/index.dart';
import 'jikan_client.dart';
import 'lib_extras.dart';

Future<RecommendationsRecentAnimeResponse> getRecentAnimeRecommendations(JikanClient client, {int page = 1}) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/recommendations/anime?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return RecommendationsRecentAnimeResponse.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw JikanException(response.body);
    }
  } catch (e, trace) {
    if (e is! JikanException) {
      print('$getRecentAnimeRecommendations: $trace');
    }
    rethrow;
  }
}
