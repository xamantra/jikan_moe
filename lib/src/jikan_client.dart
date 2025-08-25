import 'package:http/http.dart' as http;

import 'anime/index.dart';
import 'endpoints_anime.dart' as anime;
import 'endpoints_manga.dart' as manga;
import 'endpoints_seasons.dart' as seasons;
import 'endpoints_top.dart' as top;
import 'manga/index.dart';
import 'seasons/index.dart';
import 'top/index.dart';

const String _jikanV4BaseUrl = 'https://api.jikan.moe/v4';

class JikanClient {
  final http.Client _client;

  http.Client get httpClient => _client;
  String get jikanV4BaseUrl => _jikanV4BaseUrl;

  // Singleton instance
  static JikanClient? _instance;
  static JikanClient get instance => _instance ??= JikanClient();

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

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeVideosEpisodes
  Future<AnimeVideosEpisodes> getAnimeVideosEpisodes(int id, {int page = 1}) => anime.getAnimeVideosEpisodes(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimePictures
  Future<List<AnimePicturesData>> getAnimePictures(int id) => anime.getAnimePictures(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeStatistics
  Future<AnimeStatisticsData> getAnimeStatistics(int id) => anime.getAnimeStatistics(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeMoreInfo
  Future<AnimeMoreInfoData> getAnimeMoreInfo(int id) => anime.getAnimeMoreInfo(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeRecommendations
  Future<List<AnimeRecommendation>> getAnimeRecommendations(int id) => anime.getAnimeRecommendations(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeUserUpdates
  Future<AnimeUserUpdates> getAnimeUserUpdates(int id, {int page = 1}) => anime.getAnimeUserUpdates(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeReviews
  Future<AnimeReviews> getAnimeReviews(int id, {int page = 1, bool preliminary = true, bool spoilers = false}) => anime.getAnimeReviews(this, id, page: page, preliminary: preliminary, spoilers: spoilers);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeRelations
  Future<List<AnimeRelation>> getAnimeRelations(int id) => anime.getAnimeRelations(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeThemes
  Future<AnimeThemesData> getAnimeThemes(int id) => anime.getAnimeThemes(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeExternal
  Future<List<AnimeExternal>> getAnimeExternal(int id) => anime.getAnimeExternal(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeStreaming
  Future<List<AnimeStreaming>> getAnimeStreaming(int id) => anime.getAnimeStreaming(this, id);

  /// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeSearch
  ///
  /// - _unapproved_ - This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error. You do not need to pass a value to it. e.g usage: `?unapproved`
  /// - _q_ - Search query.
  /// - _type_ - "tv" "movie" "ova" "special" "ona" "music" "cm" "pv" "tv_special"
  /// - _minScore_ - Set a minimum score for results.
  /// - _maxScore_ - Set a maximum score for results.
  /// - _status_ - "airing" "complete" "upcoming"
  /// - _rating_ - "g" "pg" "pg13" "r17" "r" "rx"
  /// - _sfw_ - Filter results to only include safe for work content.
  /// - _genres_ - Filter by genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _genresExclude_ - Exclude genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _orderBy_ - "mal_id" "title" "start_date" "end_date" "episodes" "score" "scored_by" "rank" "popularity" "members" "favorites"
  /// - _sort_ - "desc" "asc"
  /// - _letter_ - Return entries starting with the given letter
  /// - _producers_ - Filter by producer(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _startDate_ - Filter by starting date. Format: YYYY-MM-DD. e.g `2022`, `2005-05`, `2005-01-01`
  /// - _endDate_ - Filter by ending date. Format: YYYY-MM-DD. e.g `2022`, `2005-05`, `2005-01-01`
  Future<AnimeSearchResponse> getAnimeSearch({
    bool unapproved = false,
    int? page = 1,
    int? limit = 25,
    String? q,
    String? type,
    double? score,
    double? minScore,
    double? maxScore,
    String? status,
    String? rating,
    bool? sfw = true,
    String? genres,
    String? genresExclude,
    String? orderBy,
    String? sort,
    String? letter,
    String? producers,
    String? startDate,
    String? endDate,
  }) => anime.getAnimeSearch(
    this,
    unapproved: unapproved,
    page: page,
    limit: limit,
    q: q,
    type: type,
    score: score,
    minScore: minScore,
    maxScore: maxScore,
    status: status,
    rating: rating,
    sfw: sfw,
    genres: genres,
    genresExclude: genresExclude,
    orderBy: orderBy,
    sort: sort,
    letter: letter,
    producers: producers,
    startDate: startDate,
    endDate: endDate,
  );

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaById
  Future<MangaData> getMangaById(int id) => manga.getMangaById(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaFullById
  Future<MangaFullData> getMangaFullById(int id) => manga.getMangaFullById(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaCharacters
  Future<List<MangaCharacter>> getMangaCharacters(int id) => manga.getMangaCharacters(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaNews
  Future<MangaNews> getMangaNews(int id, {int page = 1}) => manga.getMangaNews(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaTopics
  ///
  /// filter: `all`, `episode`, `other`
  Future<List<MangaForumTopic>> getMangaTopics(int id, {String filter = "all"}) => manga.getMangaTopics(this, id, filter: filter);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaPictures
  Future<List<MangaImages>> getMangaPictures(int id) => manga.getMangaPictures(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaStatistics
  Future<MangaStatisticsData> getMangaStatistics(int id) => manga.getMangaStatistics(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaMoreInfo
  Future<MangaMoreInfoData> getMangaMoreInfo(int id) => manga.getMangaMoreInfo(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaRecommendations
  Future<List<MangaRecommendation>> getMangaRecommendations(int id) => manga.getMangaRecommendations(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaUserUpdates
  Future<MangaUserUpdates> getMangaUserUpdates(int id, {int page = 1}) => manga.getMangaUserUpdates(this, id, page: page);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaReviews
  Future<MangaReviews> getMangaReviews(int id, {int page = 1, bool preliminary = true, bool spoilers = false}) => manga.getMangaReviews(this, id, page: page, preliminary: preliminary, spoilers: spoilers);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaRelations
  Future<List<MangaRelation>> getMangaRelations(int id) => manga.getMangaRelations(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaExternal
  Future<List<MangaExternal>> getMangaExternal(int id) => manga.getMangaExternal(this, id);

  /// https://docs.api.jikan.moe/#tag/manga/operation/getMangaSearch
  ///
  /// - _unapproved_ - This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error. You do not need to pass a value to it. e.g usage: `?unapproved`
  /// - _q_ - Search query.
  /// - _type_ - "manga" "novel" "lightnovel" "oneshot" "doujin" "manhwa" "manhua"
  /// - _minScore_ - Set a minimum score for results.
  /// - _maxScore_ - Set a maximum score for results.
  /// - _status_ - "publishing" "complete" "hiatus" "discontinued" "upcoming"
  /// - _sfw_ - Filter results to only include safe for work content.
  /// - _genres_ - Filter by genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _genresExclude_ - Exclude genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _orderBy_ - "mal_id" "title" "start_date" "end_date" "chapters" "volumes" "score" "scored_by" "rank" "popularity" "members" "favorites"
  /// - _sort_ - "desc" "asc"
  /// - _letter_ - Return entries starting with the given letter
  /// - _magazines_ - Filter by magazine(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  /// - _startDate_ - Filter by starting date. Format: YYYY-MM-DD. e.g `2022`, `2005-05`, `2005-01-01`
  /// - _endDate_ - Filter by ending date. Format: YYYY-MM-DD. e.g `2022`, `2005-05`, `2005-01-01`
  Future<MangaSearchResponse> getMangaSearch({
    bool unapproved = false,
    int? page = 1,
    int? limit = 25,
    String? q,
    String? type,
    double? score,
    double? minScore,
    double? maxScore,
    String? status,
    bool? sfw = true,
    String? genres,
    String? genresExclude,
    String? orderBy,
    String? sort,
    String? letter,
    String? magazines,
    String? startDate,
    String? endDate,
  }) => manga.getMangaSearch(
    this,
    unapproved: unapproved,
    page: page,
    limit: limit,
    q: q,
    type: type,
    score: score,
    minScore: minScore,
    maxScore: maxScore,
    status: status,
    sfw: sfw,
    genres: genres,
    genresExclude: genresExclude,
    orderBy: orderBy,
    sort: sort,
    letter: letter,
    magazines: magazines,
    startDate: startDate,
    endDate: endDate,
  );

  /// https://docs.api.jikan.moe/#tag/seasons/operation/getSeasonNow
  ///
  /// - _filter_ - "tv" "movie" "ova" "special" "ona" "music"
  /// - _sfw_ - 'Safe For Work'. This is a flag. When supplied it will filter out entries according to the SFW Policy.
  /// - _unapproved_ - This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error.
  /// - _continuing_ - This is a flag. When supplied it will include entries which are continuing from previous seasons. MAL includes these items on the seasons view in the ″TV (continuing)″ section.
  Future<SeasonNowResponse> getSeasonNow({
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
  }) => seasons.getSeasonNow(
    this,
    filter: filter,
    sfw: sfw,
    unapproved: unapproved,
    continuing: continuing,
    page: page,
    limit: limit,
  );

  /// https://docs.api.jikan.moe/#tag/seasons/operation/getSeason
  ///
  /// - _year_ - Year of the season
  /// - _season_ - Season name: "winter" "spring" "summer" "fall"
  /// - _filter_ - "tv" "movie" "ova" "special" "ona" "music"
  /// - _sfw_ - 'Safe For Work'. This is a flag. When supplied it will filter out entries according to the SFW Policy.
  /// - _unapproved_ - This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error.
  /// - _continuing_ - This is a flag. When supplied it will include entries which are continuing from previous seasons. MAL includes these items on the seasons view in the ″TV (continuing)″ section.
  Future<SeasonGetResponse> getSeason(
    int year,
    String season, {
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
  }) => seasons.getSeason(
    this,
    year,
    season,
    filter: filter,
    sfw: sfw,
    unapproved: unapproved,
    continuing: continuing,
    page: page,
    limit: limit,
  );

  /// https://docs.api.jikan.moe/#tag/seasons/operation/getSeasonsList
  Future<SeasonListResponse> getSeasonsList() => seasons.getSeasonsList(this);

  /// https://docs.api.jikan.moe/#tag/seasons/operation/getSeasonUpcoming
  ///
  /// - _filter_ - "tv" "movie" "ova" "special" "ona" "music"
  /// - _sfw_ - 'Safe For Work'. This is a flag. When supplied it will filter out entries according to the SFW Policy.
  /// - _unapproved_ - This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error.
  /// - _continuing_ - This is a flag. When supplied it will include entries which are continuing from previous seasons. MAL includes these items on the seasons view in the ″TV (continuing)″ section.
  Future<SeasonUpcomingResponse> getSeasonUpcoming({
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
  }) => seasons.getSeasonUpcoming(
    this,
    filter: filter,
    sfw: sfw,
    unapproved: unapproved,
    continuing: continuing,
    page: page,
    limit: limit,
  );

  /// https://docs.api.jikan.moe/#tag/top/operation/getTopAnime
  ///
  /// - _type_ - "tv" "movie" "ova" "special" "ona" "music" "cm" "pv" "tv_special"
  /// - _filter_ - "airing" "upcoming" "bypopularity" "favorite"
  /// - _rating_ - "g" "pg" "pg13" "r17" "r" "rx"
  /// - _sfw_ - Filter out Adult entries
  /// - _page_ - Page number
  /// - _limit_ - Number of results per page
  Future<TopAnimeResponse> getTopAnime({
    String? type,
    String? filter,
    String? rating,
    bool? sfw,
    int page = 1,
    int limit = 25,
  }) => top.getTopAnime(
    this,
    type: type,
    filter: filter,
    rating: rating,
    sfw: sfw,
    page: page,
    limit: limit,
  );

  /// https://docs.api.jikan.moe/#tag/top/operation/getTopManga
  ///
  /// - _type_ - "manga" "novel" "lightnovel" "oneshot" "doujin" "manhwa" "manhua"
  /// - _filter_ - "publishing" "upcoming" "bypopularity" "favorite"
  /// - _sfw_ - Filter out Adult entries
  /// - _page_ - Page number
  /// - _limit_ - Number of results per page
  Future<TopMangaResponse> getTopManga({
    String? type,
    String? filter,
    bool? sfw,
    int page = 1,
    int limit = 25,
  }) => top.getTopManga(
    this,
    type: type,
    filter: filter,
    sfw: sfw,
    page: page,
    limit: limit,
  );

  /// https://docs.api.jikan.moe/#tag/top/operation/getTopPeople
  ///
  /// - _page_ - Page number
  /// - _limit_ - Number of results per page
  Future<TopPeopleResponse> getTopPeople({
    int page = 1,
    int limit = 25,
  }) => top.getTopPeople(
    this,
    page: page,
    limit: limit,
  );
}
