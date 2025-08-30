import 'manga_full.dart';

class MangaDataResponse {
  final MangaData data;

  MangaDataResponse({required this.data});

  factory MangaDataResponse.fromJson(Map<String, dynamic> json) {
    return MangaDataResponse(
      data: MangaData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class MangaData {
  final int malId;
  final String url;
  final MangaImages images;
  final bool approved;
  final List<MangaTitle> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final int? chapters;
  final int? volumes;
  final String status;
  final bool publishing;
  final MangaPublished published;
  final double? score;
  final double? scored;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final List<MangaAuthor> authors;
  final List<MangaSerialization> serializations;
  final List<MangaGenre> genres;
  final List<MangaGenre> explicitGenres;
  final List<MangaGenre> themes;
  final List<MangaGenre> demographics;

  MangaData({
    required this.malId,
    required this.url,
    required this.images,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    this.chapters,
    this.volumes,
    required this.status,
    required this.publishing,
    required this.published,
    this.score,
    this.scored,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    required this.authors,
    required this.serializations,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory MangaData.fromJson(Map<String, dynamic> json) {
    return MangaData(
      malId: json['mal_id'],
      url: json['url'],
      images: MangaImages.fromJson(json['images']),
      approved: json['approved'],
      titles: (json['titles'] as List).map((e) => MangaTitle.fromJson(e)).toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'],
      chapters: json['chapters'],
      volumes: json['volumes'],
      status: json['status'],
      publishing: json['publishing'],
      published: MangaPublished.fromJson(json['published']),
      score: json['score']?.toDouble(),
      scored: json['scored']?.toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      authors: (json['authors'] as List).map((e) => MangaAuthor.fromJson(e)).toList(),
      serializations: (json['serializations'] as List).map((e) => MangaSerialization.fromJson(e)).toList(),
      genres: (json['genres'] as List).map((e) => MangaGenre.fromJson(e)).toList(),
      explicitGenres: (json['explicit_genres'] as List).map((e) => MangaGenre.fromJson(e)).toList(),
      themes: (json['themes'] as List).map((e) => MangaGenre.fromJson(e)).toList(),
      demographics: (json['demographics'] as List).map((e) => MangaGenre.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'approved': approved,
      'titles': titles.map((e) => e.toJson()).toList(),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': titleSynonyms,
      'type': type,
      'chapters': chapters,
      'volumes': volumes,
      'status': status,
      'publishing': publishing,
      'published': published.toJson(),
      'score': score,
      'scored': scored,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'authors': authors.map((e) => e.toJson()).toList(),
      'serializations': serializations.map((e) => e.toJson()).toList(),
      'genres': genres.map((e) => e.toJson()).toList(),
      'explicit_genres': explicitGenres.map((e) => e.toJson()).toList(),
      'themes': themes.map((e) => e.toJson()).toList(),
      'demographics': demographics.map((e) => e.toJson()).toList(),
    };
  }
}
