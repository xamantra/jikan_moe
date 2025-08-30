# [Jikan API](https://jikan.moe/) v4

Jikan (時間) is an unofficial & open-source API for the _“most active online
anime + manga community and database”_ — MyAnimeList.
[Official Docs here](https://docs.api.jikan.moe/)

```txt
NOTE: Not yet ready for production use.
```

# Dart / Flutter

Usage example:

```dart
// with singletone instance
final anime = await JikanClient.instance.getAnimeById(21); // One Piece

// with Instantiator
final client = JikanClient(); // useful for passing custom http Client
final anime = await client.getAnimeById(21); // One Piece
```

# Anime

✅ 21/21 endpoints are supported.

```dart
Future<AnimeData> getAnimeById(int id)

Future<AnimeFullData> getAnimeFullById(int id)

Future<List<AnimeCharacter>> getAnimeCharacters(int id)

Future<List<AnimeStaff>> getAnimeStaff(int id)

Future<AnimeEpisodes> getAnimeEpisodes(int id, {int page = 1})

Future<AnimeEpisode> getAnimeEpisodeById(int id, {required int episode})

Future<AnimeNews> getAnimeNews(int id, {int page = 1})

Future<List<AnimeForumTopic>> getAnimeForum(int id, {String filter = "all"})

Future<AnimeVideosData> getAnimeVideos(int id)

Future<AnimeVideosEpisodes> getAnimeVideosEpisodes(int id, {int page = 1})

Future<List<AnimePicturesData>> getAnimePictures(int id)

Future<AnimeStatisticsData> getAnimeStatistics(int id)

Future<AnimeMoreInfoData> getAnimeMoreInfo(int id)

Future<List<AnimeRecommendation>> getAnimeRecommendations(int id)

Future<AnimeUserUpdates> getAnimeUserUpdates(int id, {int page = 1})

Future<AnimeReviews> getAnimeReviews(int id, {int page = 1, bool preliminary = true, bool spoilers = false})

Future<List<AnimeRelation>> getAnimeRelations(int id)

Future<AnimeThemesData> getAnimeThemes(int id)

Future<List<AnimeExternal>> getAnimeExternal(int id)

Future<List<AnimeStreaming>> getAnimeStreaming(int id)

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
})
```

# Manga

✅ 14/14 endpoints are supported.

```dart
Future<MangaData> getMangaById(int id)

Future<MangaFullData> getMangaFullById(int id)

Future<List<MangaCharacter>> getMangaCharacters(int id)

Future<MangaNews> getMangaNews(int id, {int page = 1})

Future<List<MangaForumTopic>> getMangaTopics(int id, {String filter = "all"})

Future<List<MangaImages>> getMangaPictures(int id)

Future<MangaStatisticsData> getMangaStatistics(int id)

Future<MangaMoreInfoData> getMangaMoreInfo(int id)

Future<List<MangaRecommendation>> getMangaRecommendations(int id)

Future<MangaUserUpdates> getMangaUserUpdates(int id, {int page = 1})

Future<MangaReviews> getMangaReviews(int id, {int page = 1, bool preliminary = true, bool spoilers = false})

Future<List<MangaRelation>> getMangaRelations(int id)

Future<List<MangaExternal>> getMangaExternal(int id)

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
})
```

# Characters

✅ 7/7 endpoints are supported.

```dart
Future<CharacterData> getCharacterById(int id)

Future<CharacterFullData> getCharacterFullById(int id)

Future<List<CharacterAnimeData>> getCharacterAnime(int id)

Future<List<CharacterMangaData>> getCharacterManga(int id)

Future<List<CharacterVoiceData>> getCharacterVoices(int id)

Future<List<CharacterPicturesData>> getCharacterPictures(int id)

Future<CharacterSearchResponse> getCharactersSearch({
    int? page = 1,
    int? limit = 25,
    String? q,
    String? orderBy,
    String? sort,
    String? letter,
})
```

# Clubs

Coming soon...

# Genres

✅ 2/2 endpoints are supported.

```dart
Future<List<AnimeGenreData>> getAnimeGenres({
    String? filter,
})

Future<List<MangaGenreData>> getMangaGenres({
    String? filter,
})
```

# Magazines

✅ 1/1 endpoint is supported.

```dart
Future<MagazinesResponse> getMagazines({
    int? page,
    int? limit,
    String? q,
    String? orderBy,
    String? sort,
    String? letter,
})
```

# People

✅ 7/7 endpoints are supported.

```dart
Future<PersonData> getPersonById(int id)

Future<PersonFullData> getPersonFullById(int id)

Future<List<PersonAnimeEntry>> getPersonAnime(int id)

Future<List<PersonMangaEntry>> getPersonManga(int id)

Future<List<PersonVoiceEntry>> getPersonVoices(int id)

Future<List<PersonPicturesData>> getPersonPictures(int id)

Future<PeopleSearchResponse> getPeopleSearch({
    int? page = 1,
    int? limit = 25,
    String? q,
    String? orderBy,
    String? sort,
    String? letter,
})
```

# Producers

✅ 4/4 endpoints are supported.

```dart
Future<ProducerData> getProducerById(int id)

Future<ProducerFullData> getProducerFullById(int id)

Future<List<ProducerExternal>> getProducerExternal(int id)

Future<ProducersResponse> getProducers({
    int? page = 1,
    int? limit = 25,
    String? q,
    String? orderBy,
    String? sort,
    String? letter,
})
```

# Random

✅ 5/5 endpoints are supported.

```dart
Future<AnimeData> getRandomAnime()

Future<MangaData> getRandomManga()

Future<CharacterData> getRandomCharacters()

Future<PersonData> getRandomPeople()

Future<RandomUserData> getRandomUsers()
```

# Recommendations

✅ 2/2 endpoints are supported.

```dart
Future<RecommendationsRecentAnimeResponse> getRecentAnimeRecommendations({int page = 1})

Future<RecommendationsRecentMangaResponse> getRecentMangaRecommendations({int page = 1})
```

# Reviews

✅ 2/2 endpoints are supported.

```dart
Future<ReviewsRecentAnimeResponse> getRecentAnimeReviews({
    int page = 1,
    bool preliminary = true,
    bool spoilers = false,
})

Future<ReviewsRecentMangaResponse> getRecentMangaReviews({
    int page = 1,
    bool preliminary = true,
    bool spoilers = false,
})
```

# Schedules

✅ 1/1 endpoint is supported.

```dart
Future<SchedulesResponse> getSchedules({
    String? filter,
    bool? kids,
    bool? sfw,
    bool? unapproved,
    int? page,
    int? limit,
})
```

# Users

Coming soon...

# Seasons

✅ 4/4 endpoints are supported.

```dart
Future<SeasonNowResponse> getSeasonNow({
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
})

Future<SeasonGetResponse> getSeason(
    int year,
    String season, {
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
})

Future<SeasonListResponse> getSeasonsList()

Future<SeasonUpcomingResponse> getSeasonUpcoming({
    String? filter,
    bool? sfw,
    bool? unapproved,
    bool? continuing,
    int page = 1,
    int limit = 25,
})
```

# Top

✅ 5/5 endpoints are supported.

```dart
Future<TopAnimeResponse> getTopAnime({
    String? type,
    String? filter,
    String? rating,
    bool? sfw,
    int page = 1,
    int limit = 25,
})

Future<TopMangaResponse> getTopManga({
    String? type,
    String? filter,
    bool? sfw,
    int page = 1,
    int limit = 25,
})

Future<TopPeopleResponse> getTopPeople({
    int page = 1,
    int limit = 25,
})

Future<TopCharactersResponse> getTopCharacters({
    int page = 1,
    int limit = 25,
})

Future<TopReviewsResponse> getTopReviews({
    String? type,
    bool? preliminary,
    bool? spoilers,
    int page = 1,
})
```

# Watch

✅ 4/4 endpoints are supported.

```dart
Future<WatchEpisodesResponse> getWatchRecentEpisodes()

Future<WatchEpisodesResponse> getWatchPopularEpisodes()

Future<WatchPromosResponse> getWatchRecentPromos({int page = 1})

Future<WatchPopularPromosResponse> getWatchPopularPromos()
```
