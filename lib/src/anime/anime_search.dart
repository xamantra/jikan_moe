class AnimeSearchResponse {
  final SearchPagination pagination;
  final List<AnimeSearchData> data;

  AnimeSearchResponse({
    required this.pagination,
    required this.data,
  });

  factory AnimeSearchResponse.fromJson(Map<String, dynamic> json) {
    return AnimeSearchResponse(
      pagination: SearchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => AnimeSearchData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SearchPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final SearchPaginationItems items;

  SearchPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory SearchPagination.fromJson(Map<String, dynamic> json) {
    return SearchPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: SearchPaginationItems.fromJson(json['items']),
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

class SearchPaginationItems {
  final int count;
  final int total;
  final int perPage;

  SearchPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory SearchPaginationItems.fromJson(Map<String, dynamic> json) {
    return SearchPaginationItems(
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

class AnimeSearchData {
  final int malId;
  final String url;
  final AnimeSearchImages images;
  final AnimeSearchTrailer trailer;
  final bool approved;
  final List<AnimeSearchTitle> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool airing;
  final AnimeSearchAired aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final AnimeSearchBroadcast broadcast;
  final List<AnimeSearchProducer> producers;
  final List<AnimeSearchProducer> licensors;
  final List<AnimeSearchProducer> studios;
  final List<AnimeSearchGenre> genres;
  final List<AnimeSearchGenre> explicitGenres;
  final List<AnimeSearchGenre> themes;
  final List<AnimeSearchGenre> demographics;

  AnimeSearchData({
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
    this.type,
    this.source,
    this.episodes,
    this.status,
    required this.airing,
    required this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory AnimeSearchData.fromJson(Map<String, dynamic> json) {
    return AnimeSearchData(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeSearchImages.fromJson(json['images']),
      trailer: AnimeSearchTrailer.fromJson(json['trailer']),
      approved: json['approved'],
      titles: (json['titles'] as List).map((item) => AnimeSearchTitle.fromJson(item)).toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'],
      source: json['source'],
      episodes: json['episodes'],
      status: json['status'],
      airing: json['airing'],
      aired: AnimeSearchAired.fromJson(json['aired']),
      duration: json['duration'],
      rating: json['rating'],
      score: json['score']?.toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'],
      year: json['year'],
      broadcast: AnimeSearchBroadcast.fromJson(json['broadcast']),
      producers: (json['producers'] as List).map((item) => AnimeSearchProducer.fromJson(item)).toList(),
      licensors: (json['licensors'] as List).map((item) => AnimeSearchProducer.fromJson(item)).toList(),
      studios: (json['studios'] as List).map((item) => AnimeSearchProducer.fromJson(item)).toList(),
      genres: (json['genres'] as List).map((item) => AnimeSearchGenre.fromJson(item)).toList(),
      explicitGenres: (json['explicit_genres'] as List).map((item) => AnimeSearchGenre.fromJson(item)).toList(),
      themes: (json['themes'] as List).map((item) => AnimeSearchGenre.fromJson(item)).toList(),
      demographics: (json['demographics'] as List).map((item) => AnimeSearchGenre.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'trailer': trailer.toJson(),
      'approved': approved,
      'titles': titles.map((item) => item.toJson()).toList(),
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
      'broadcast': broadcast.toJson(),
      'producers': producers.map((item) => item.toJson()).toList(),
      'licensors': licensors.map((item) => item.toJson()).toList(),
      'studios': studios.map((item) => item.toJson()).toList(),
      'genres': genres.map((item) => item.toJson()).toList(),
      'explicit_genres': explicitGenres.map((item) => item.toJson()).toList(),
      'themes': themes.map((item) => item.toJson()).toList(),
      'demographics': demographics.map((item) => item.toJson()).toList(),
    };
  }
}

class AnimeSearchImages {
  final AnimeSearchImageUrls jpg;
  final AnimeSearchImageUrls webp;

  AnimeSearchImages({
    required this.jpg,
    required this.webp,
  });

  factory AnimeSearchImages.fromJson(Map<String, dynamic> json) {
    return AnimeSearchImages(
      jpg: AnimeSearchImageUrls.fromJson(json['jpg']),
      webp: AnimeSearchImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class AnimeSearchImageUrls {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  AnimeSearchImageUrls({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory AnimeSearchImageUrls.fromJson(Map<String, dynamic> json) {
    return AnimeSearchImageUrls(
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

class AnimeSearchTrailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final AnimeSearchTrailerImages images;

  AnimeSearchTrailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    required this.images,
  });

  factory AnimeSearchTrailer.fromJson(Map<String, dynamic> json) {
    return AnimeSearchTrailer(
      youtubeId: json['youtube_id'],
      url: json['url'],
      embedUrl: json['embed_url'],
      images: AnimeSearchTrailerImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class AnimeSearchTrailerImages {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  AnimeSearchTrailerImages({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory AnimeSearchTrailerImages.fromJson(Map<String, dynamic> json) {
    return AnimeSearchTrailerImages(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      mediumImageUrl: json['medium_image_url'],
      largeImageUrl: json['large_image_url'],
      maximumImageUrl: json['maximum_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

class AnimeSearchTitle {
  final String type;
  final String title;

  AnimeSearchTitle({
    required this.type,
    required this.title,
  });

  factory AnimeSearchTitle.fromJson(Map<String, dynamic> json) {
    return AnimeSearchTitle(
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

class AnimeSearchAired {
  final DateTime? from;
  final DateTime? to;
  final AnimeSearchAiredProp prop;
  final String? string;

  AnimeSearchAired({
    this.from,
    this.to,
    required this.prop,
    this.string,
  });

  factory AnimeSearchAired.fromJson(Map<String, dynamic> json) {
    return AnimeSearchAired(
      from: json['from'] != null ? DateTime.parse(json['from']) : null,
      to: json['to'] != null ? DateTime.parse(json['to']) : null,
      prop: AnimeSearchAiredProp.fromJson(json['prop']),
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

class AnimeSearchAiredProp {
  final AnimeSearchAiredDate from;
  final AnimeSearchAiredDate to;

  AnimeSearchAiredProp({
    required this.from,
    required this.to,
  });

  factory AnimeSearchAiredProp.fromJson(Map<String, dynamic> json) {
    return AnimeSearchAiredProp(
      from: AnimeSearchAiredDate.fromJson(json['from']),
      to: AnimeSearchAiredDate.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}

class AnimeSearchAiredDate {
  final int? day;
  final int? month;
  final int? year;

  AnimeSearchAiredDate({
    this.day,
    this.month,
    this.year,
  });

  factory AnimeSearchAiredDate.fromJson(Map<String, dynamic> json) {
    return AnimeSearchAiredDate(
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

class AnimeSearchBroadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  AnimeSearchBroadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory AnimeSearchBroadcast.fromJson(Map<String, dynamic> json) {
    return AnimeSearchBroadcast(
      day: json['day'],
      time: json['time'],
      timezone: json['timezone'],
      string: json['string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone,
      'string': string,
    };
  }
}

class AnimeSearchProducer {
  final int malId;
  final String type;
  final String name;
  final String url;

  AnimeSearchProducer({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory AnimeSearchProducer.fromJson(Map<String, dynamic> json) {
    return AnimeSearchProducer(
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

class AnimeSearchGenre {
  final int malId;
  final String type;
  final String name;
  final String url;

  AnimeSearchGenre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory AnimeSearchGenre.fromJson(Map<String, dynamic> json) {
    return AnimeSearchGenre(
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
