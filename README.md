# [Jikan API](https://jikan.moe/)

Jikan (時間) is an unofficial & open-source API for the _“most active online
anime + manga community and database”_ — MyAnimeList.
[Official Docs here](https://docs.api.jikan.moe/)

> NOTE: Not yet ready for production use.

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

Coming soon...

# Characters

Coming soon...

# Clubs

Coming soon...

# Genres

Coming soon...

# Magazines

Coming soon...

# People

Coming soon...

# Producers

Coming soon...

# Random

Coming soon...

# Recommendations

Coming soon...

# Reviews

Coming soon...

# Schedules

Coming soon...

# Users

Coming soon...

# Seasons

Coming soon...

# Top

Coming soon...

# Watch

Coming soon...
