import 'package:http/http.dart' as http;

import 'anime/anime_full.dart';
import 'anime/endpoints_anime.dart' as anime;

const String _jikanV4BaseUrl = 'https://api.jikan.moe/v4';

class JikanClient {
  final http.Client _client;

  http.Client get httpClient => _client;
  String get jikanV4BaseUrl => _jikanV4BaseUrl;

  JikanClient({http.Client? client}) : _client = client ?? http.Client();

  Future<AnimeFullData> getAnimeFullById(int id) => anime.getAnimeFullById(this, id);
}
