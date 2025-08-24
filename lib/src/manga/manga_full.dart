class MangaFullResponse {
  final MangaFullData data;

  MangaFullResponse({required this.data});

  factory MangaFullResponse.fromJson(Map<String, dynamic> json) {
    return MangaFullResponse(
      data: MangaFullData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class MangaFullData {
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
  final double score;
  final double scored;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String? synopsis;
  final String? background;
  final List<MangaAuthor> authors;
  final List<MangaSerialization> serializations;
  final List<MangaGenre> genres;
  final List<MangaGenre> explicitGenres;
  final List<MangaGenre> themes;
  final List<MangaGenre> demographics;
  final List<MangaRelation> relations;
  final List<MangaExternal> external;

  MangaFullData({
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
    required this.score,
    required this.scored,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    this.synopsis,
    this.background,
    required this.authors,
    required this.serializations,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    required this.relations,
    required this.external,
  });

  factory MangaFullData.fromJson(Map<String, dynamic> json) {
    return MangaFullData(
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
      score: json['score'].toDouble(),
      scored: json['scored'].toDouble(),
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
      relations: (json['relations'] as List).map((e) => MangaRelation.fromJson(e)).toList(),
      external: (json['external'] as List).map((e) => MangaExternal.fromJson(e)).toList(),
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
      'relations': relations.map((e) => e.toJson()).toList(),
      'external': external.map((e) => e.toJson()).toList(),
    };
  }
}

class MangaImages {
  final MangaImageUrls jpg;
  final MangaImageUrls webp;

  MangaImages({required this.jpg, required this.webp});

  factory MangaImages.fromJson(Map<String, dynamic> json) {
    return MangaImages(
      jpg: MangaImageUrls.fromJson(json['jpg']),
      webp: MangaImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class MangaImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  MangaImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory MangaImageUrls.fromJson(Map<String, dynamic> json) {
    return MangaImageUrls(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

class MangaTitle {
  final String type;
  final String title;

  MangaTitle({required this.type, required this.title});

  factory MangaTitle.fromJson(Map<String, dynamic> json) {
    return MangaTitle(
      type: json['type'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}

class MangaPublished {
  final DateTime? from;
  final DateTime? to;
  final MangaPublishedProp prop;
  final String string;

  MangaPublished({
    this.from,
    this.to,
    required this.prop,
    required this.string,
  });

  factory MangaPublished.fromJson(Map<String, dynamic> json) {
    return MangaPublished(
      from: json['from'] != null ? DateTime.parse(json['from']) : null,
      to: json['to'] != null ? DateTime.parse(json['to']) : null,
      prop: MangaPublishedProp.fromJson(json['prop']),
      string: json['string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from?.toIso8601String(),
      'to': to?.toIso8601String(),
      'prop': prop.toJson(),
      'string': string,
    };
  }
}

class MangaPublishedProp {
  final MangaPublishedDate from;
  final MangaPublishedDate to;

  MangaPublishedProp({required this.from, required this.to});

  factory MangaPublishedProp.fromJson(Map<String, dynamic> json) {
    return MangaPublishedProp(
      from: MangaPublishedDate.fromJson(json['from']),
      to: MangaPublishedDate.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}

class MangaPublishedDate {
  final int? day;
  final int? month;
  final int? year;

  MangaPublishedDate({this.day, this.month, this.year});

  factory MangaPublishedDate.fromJson(Map<String, dynamic> json) {
    return MangaPublishedDate(
      day: json['day'],
      month: json['month'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
    };
  }
}

class MangaAuthor {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaAuthor({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaAuthor.fromJson(Map<String, dynamic> json) {
    return MangaAuthor(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class MangaSerialization {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaSerialization({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaSerialization.fromJson(Map<String, dynamic> json) {
    return MangaSerialization(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class MangaGenre {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaGenre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaGenre.fromJson(Map<String, dynamic> json) {
    return MangaGenre(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class MangaRelation {
  final String relation;
  final List<MangaRelationEntry> entry;

  MangaRelation({required this.relation, required this.entry});

  factory MangaRelation.fromJson(Map<String, dynamic> json) {
    return MangaRelation(
      relation: json['relation'],
      entry: (json['entry'] as List).map((e) => MangaRelationEntry.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'relation': relation,
      'entry': entry.map((e) => e.toJson()).toList(),
    };
  }
}

class MangaRelationEntry {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaRelationEntry({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaRelationEntry.fromJson(Map<String, dynamic> json) {
    return MangaRelationEntry(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class MangaExternal {
  final String name;
  final String url;

  MangaExternal({required this.name, required this.url});

  factory MangaExternal.fromJson(Map<String, dynamic> json) {
    return MangaExternal(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
