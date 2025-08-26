import 'dart:convert';

import 'jikan_client.dart';
import 'watch/index.dart';

Future<WatchEpisodesResponse> getWatchRecentEpisodes(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/watch/episodes'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WatchEpisodesResponse.fromJson(json);
  } else {
    throw Exception('Failed to load watch recent episodes: ${response.statusCode}');
  }
}

Future<WatchEpisodesResponse> getWatchPopularEpisodes(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/watch/episodes/popular'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WatchEpisodesResponse.fromJson(json);
  } else {
    throw Exception('Failed to load watch popular episodes: ${response.statusCode}');
  }
}

// getWatchRecentPromos -> {{baseUrl}}/watch/promos?page=1

// getWatchPopularPromos -> {{baseUrl}}/watch/promos/popular
