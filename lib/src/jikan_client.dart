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

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeCharacters
  Future<List<AnimeCharacter>> getAnimeCharacters(int id) => anime.getAnimeCharacters(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeStaff
  Future<List<AnimeStaff>> getAnimeStaff(int id) => anime.getAnimeStaff(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeEpisodes
  Future<AnimeEpisodes> getAnimeEpisodes(int id, {int page = 1}) => anime.getAnimeEpisodes(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeEpisodeById
  Future<AnimeEpisode> getAnimeEpisodeById(int id, {required int episode}) => anime.getAnimeEpisodeById(this, id, episode: episode);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeNews
  Future<AnimeNews> getAnimeNews(int id, {int page = 1}) => anime.getAnimeNews(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeForum
  ///
  /// filter: `all`, `episode`, `other`
  Future<List<AnimeForumTopic>> getAnimeForum(int id, {String filter = "all"}) => anime.getAnimeForum(this, id, filter: filter);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeVideos
  Future<AnimeVideosData> getAnimeVideos(int id) => anime.getAnimeVideos(this, id);
}
