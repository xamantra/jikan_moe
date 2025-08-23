import 'package:http/http.dart' as http;

import 'anime/index.dart';
import 'endpoints_anime.dart' as anime;

const String _jikanV4BaseUrl = 'https://api.jikan.moe/v4';

class JikanClient {
  final http.Client _client;

  http.Client get httpClient => _client;
  String get jikanV4BaseUrl => _jikanV4BaseUrl;

  JikanClient({http.Client? client}) : _client = client ?? http.Client();

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeFullById
  Future<AnimeFullData> getAnimeFullById(int id) => anime.getAnimeFullById(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeById
  Future<AnimeData> getAnimeById(int id) => anime.getAnimeById(this, id);
}
