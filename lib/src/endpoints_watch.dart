import 'dart:convert';

import 'jikan_client.dart';
import 'watch/watch_recent_episodes.dart';

Future<WatchRecentEpisodesResponse> getWatchRecentEpisodes(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/watch/episodes'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WatchRecentEpisodesResponse.fromJson(json);
  } else {
    throw Exception('Failed to load watch recent episodes: ${response.statusCode}');
  }
}

// getWatchPopularEpisodes -> {{baseUrl}}/watch/episodes/popular

// getWatchRecentPromos -> {{baseUrl}}/watch/promos?page=1

// getWatchPopularPromos -> {{baseUrl}}/watch/promos/popular
