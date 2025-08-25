import 'anime_full.dart';

// Regular anime data model (subset of AnimeFullData)
class AnimeData {
  final int malId;
  final String url;
  final AnimeImages images;
  final AnimeTrailer trailer;
  final bool approved;
  final List<AnimeTitle> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int? episodes;
  final String status;
  final bool airing;
  final AnimeAired aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int scoredBy;
  final int? rank;
  final int? popularity;
  final int members;
  final int favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final AnimeBroadcast? broadcast;
  final List<AnimeProducer> producers;
  final List<AnimeProducer> licensors;
  final List<AnimeProducer> studios;
  final List<AnimeGenre> genres;
  final List<AnimeGenre> explicitGenres;
  final List<AnimeGenre> themes;
  final List<AnimeGenre> demographics;

  AnimeData({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy = 0,
    this.rank,
    this.popularity,
    this.members = 0,
    this.favorites = 0,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory AnimeData.fromJson(Map<String, dynamic> json) {
    return AnimeData(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeImages.fromJson(json['images']),
      trailer: AnimeTrailer.fromJson(json['trailer']),
      approved: json['approved'],
      titles: (json['titles'] as List).map((title) => AnimeTitle.fromJson(title)).toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'] ?? 'unknown',
      source: json['source'],
      episodes: json['episodes'],
      status: json['status'],
      airing: json['airing'] ?? false,
      aired: AnimeAired.fromJson(json['aired']),
      duration: json['duration'],
      rating: json['rating'],
      score: json['score']?.toDouble(),
      scoredBy: json['scored_by'] ?? 0,
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'],
      year: json['year'],
      broadcast: json['broadcast'] != null ? AnimeBroadcast.fromJson(json['broadcast']) : null,
      producers: (json['producers'] as List).map((producer) => AnimeProducer.fromJson(producer)).toList(),
      licensors: (json['licensors'] as List).map((licensor) => AnimeProducer.fromJson(licensor)).toList(),
      studios: (json['studios'] as List).map((studio) => AnimeProducer.fromJson(studio)).toList(),
      genres: (json['genres'] as List).map((genre) => AnimeGenre.fromJson(genre)).toList(),
      explicitGenres: (json['explicit_genres'] as List).map((genre) => AnimeGenre.fromJson(genre)).toList(),
      themes: (json['themes'] as List).map((theme) => AnimeGenre.fromJson(theme)).toList(),
      demographics: (json['demographics'] as List).map((demographic) => AnimeGenre.fromJson(demographic)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'trailer': trailer.toJson(),
      'approved': approved,
      'titles': titles.map((title) => title.toJson()).toList(),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': titleSynonyms,
      'type': type,
      'source': source,
      'episodes': episodes,
      'status': status,
      'airing': airing,
      'aired': aired.toJson(),
      'duration': duration,
      'rating': rating,
      'score': score,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'season': season,
      'year': year,
      'broadcast': broadcast?.toJson(),
      'producers': producers.map((producer) => producer.toJson()).toList(),
      'licensors': licensors.map((licensor) => licensor.toJson()).toList(),
      'studios': studios.map((studio) => studio.toJson()).toList(),
      'genres': genres.map((genre) => genre.toJson()).toList(),
      'explicit_genres': explicitGenres.map((genre) => genre.toJson()).toList(),
      'themes': themes.map((theme) => theme.toJson()).toList(),
      'demographics': demographics.map((demographic) => demographic.toJson()).toList(),
    };
  }
}
