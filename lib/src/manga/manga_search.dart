// TODO: add prefix to all model classes: "MangaSearch$EntityName$"
class MangaSearchResponse {
  final MangaSearchPagination pagination;
  final List<MangaSearchData> data;

  MangaSearchResponse({
    required this.pagination,
    required this.data,
  });

  factory MangaSearchResponse.fromJson(Map<String, dynamic> json) {
    return MangaSearchResponse(
      pagination: MangaSearchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => MangaSearchData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class MangaSearchPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final MangaSearchPaginationItems items;

  MangaSearchPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory MangaSearchPagination.fromJson(Map<String, dynamic> json) {
    return MangaSearchPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: MangaSearchPaginationItems.fromJson(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
      'current_page': currentPage,
      'items': items.toJson(),
    };
  }
}

class MangaSearchPaginationItems {
  final int count;
  final int total;
  final int perPage;

  MangaSearchPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory MangaSearchPaginationItems.fromJson(Map<String, dynamic> json) {
    return MangaSearchPaginationItems(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'per_page': perPage,
    };
  }
}

class MangaSearchData {
  final int malId;
  final String url;
  final MangaSearchImages images;
  final bool approved;
  final List<MangaSearchTitle> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String? type;
  final int? chapters;
  final int? volumes;
  final String? status;
  final bool publishing;
  final MangaSearchPublished published;
  final double? score;
  final double? scored;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final List<MangaSearchAuthor> authors;
  final List<MangaSearchSerialization> serializations;
  final List<MangaSearchGenre> genres;
  final List<MangaSearchGenre> explicitGenres;
  final List<MangaSearchGenre> themes;
  final List<MangaSearchGenre> demographics;

  MangaSearchData({
    required this.malId,
    required this.url,
    required this.images,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    this.type,
    this.chapters,
    this.volumes,
    this.status,
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

  factory MangaSearchData.fromJson(Map<String, dynamic> json) {
    return MangaSearchData(
      malId: json['mal_id'],
      url: json['url'],
      images: MangaSearchImages.fromJson(json['images']),
      approved: json['approved'],
      titles: (json['titles'] as List).map((item) => MangaSearchTitle.fromJson(item)).toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'],
      chapters: json['chapters'],
      volumes: json['volumes'],
      status: json['status'],
      publishing: json['publishing'],
      published: MangaSearchPublished.fromJson(json['published']),
      score: json['score']?.toDouble(),
      scored: json['scored']?.toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      authors: (json['authors'] as List).map((item) => MangaSearchAuthor.fromJson(item)).toList(),
      serializations: (json['serializations'] as List).map((item) => MangaSearchSerialization.fromJson(item)).toList(),
      genres: (json['genres'] as List).map((item) => MangaSearchGenre.fromJson(item)).toList(),
      explicitGenres: (json['explicit_genres'] as List).map((item) => MangaSearchGenre.fromJson(item)).toList(),
      themes: (json['themes'] as List).map((item) => MangaSearchGenre.fromJson(item)).toList(),
      demographics: (json['demographics'] as List).map((item) => MangaSearchGenre.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'approved': approved,
      'titles': titles.map((item) => item.toJson()).toList(),
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
      'authors': authors.map((item) => item.toJson()).toList(),
      'serializations': serializations.map((item) => item.toJson()).toList(),
      'genres': genres.map((item) => item.toJson()).toList(),
      'explicit_genres': explicitGenres.map((item) => item.toJson()).toList(),
      'themes': themes.map((item) => item.toJson()).toList(),
      'demographics': demographics.map((item) => item.toJson()).toList(),
    };
  }
}

class MangaSearchImages {
  final MangaSearchImageUrls jpg;
  final MangaSearchImageUrls webp;

  MangaSearchImages({
    required this.jpg,
    required this.webp,
  });

  factory MangaSearchImages.fromJson(Map<String, dynamic> json) {
    return MangaSearchImages(
      jpg: MangaSearchImageUrls.fromJson(json['jpg']),
      webp: MangaSearchImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class MangaSearchImageUrls {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  MangaSearchImageUrls({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory MangaSearchImageUrls.fromJson(Map<String, dynamic> json) {
    return MangaSearchImageUrls(
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

class MangaSearchTitle {
  final String type;
  final String title;

  MangaSearchTitle({
    required this.type,
    required this.title,
  });

  factory MangaSearchTitle.fromJson(Map<String, dynamic> json) {
    return MangaSearchTitle(
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

class MangaSearchPublished {
  final DateTime? from;
  final DateTime? to;
  final MangaSearchPublishedProp prop;
  final String? string;

  MangaSearchPublished({
    this.from,
    this.to,
    required this.prop,
    this.string,
  });

  factory MangaSearchPublished.fromJson(Map<String, dynamic> json) {
    return MangaSearchPublished(
      from: json['from'] != null ? DateTime.parse(json['from']) : null,
      to: json['to'] != null ? DateTime.parse(json['to']) : null,
      prop: MangaSearchPublishedProp.fromJson(json['prop']),
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

class MangaSearchPublishedProp {
  final MangaSearchPublishedDate from;
  final MangaSearchPublishedDate to;

  MangaSearchPublishedProp({
    required this.from,
    required this.to,
  });

  factory MangaSearchPublishedProp.fromJson(Map<String, dynamic> json) {
    return MangaSearchPublishedProp(
      from: MangaSearchPublishedDate.fromJson(json['from']),
      to: MangaSearchPublishedDate.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}

class MangaSearchPublishedDate {
  final int? day;
  final int? month;
  final int? year;

  MangaSearchPublishedDate({
    this.day,
    this.month,
    this.year,
  });

  factory MangaSearchPublishedDate.fromJson(Map<String, dynamic> json) {
    return MangaSearchPublishedDate(
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

class MangaSearchAuthor {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaSearchAuthor({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaSearchAuthor.fromJson(Map<String, dynamic> json) {
    return MangaSearchAuthor(
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

class MangaSearchSerialization {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaSearchSerialization({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaSearchSerialization.fromJson(Map<String, dynamic> json) {
    return MangaSearchSerialization(
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

class MangaSearchGenre {
  final int malId;
  final String type;
  final String name;
  final String url;

  MangaSearchGenre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory MangaSearchGenre.fromJson(Map<String, dynamic> json) {
    return MangaSearchGenre(
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
