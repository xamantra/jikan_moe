import 'dart:convert';
import 'jikan_client.dart';
import 'random/random_anime.dart';
import 'anime/anime_data.dart';

Future<AnimeData> getRandomAnime(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/anime'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomAnimeData = RandomAnimeData.fromJson(json);
    return randomAnimeData.data;
  } else {
    throw Exception('Failed to load random anime: ${response.statusCode}');
  }
}
