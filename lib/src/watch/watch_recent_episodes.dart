class WatchRecentEpisodesResponse {
  final WatchPagination pagination;
  final List<WatchRecentEpisodeData> data;

  WatchRecentEpisodesResponse({
    required this.pagination,
    required this.data,
  });

  factory WatchRecentEpisodesResponse.fromJson(Map<String, dynamic> json) {
    return WatchRecentEpisodesResponse(
      pagination: WatchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => WatchRecentEpisodeData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class WatchPagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  WatchPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory WatchPagination.fromJson(Map<String, dynamic> json) {
    return WatchPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
    };
  }
}

class WatchRecentEpisodeData {
  final WatchAnimeEntry entry;
  final List<WatchEpisode> episodes;
  final bool regionLocked;

  WatchRecentEpisodeData({
    required this.entry,
    required this.episodes,
    required this.regionLocked,
  });

  factory WatchRecentEpisodeData.fromJson(Map<String, dynamic> json) {
    return WatchRecentEpisodeData(
      entry: WatchAnimeEntry.fromJson(json['entry']),
      episodes: (json['episodes'] as List).map((item) => WatchEpisode.fromJson(item)).toList(),
      regionLocked: json['region_locked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entry': entry.toJson(),
      'episodes': episodes.map((item) => item.toJson()).toList(),
      'region_locked': regionLocked,
    };
  }
}

class WatchAnimeEntry {
  final int malId;
  final String url;
  final WatchAnimeImages images;
  final String title;

  WatchAnimeEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory WatchAnimeEntry.fromJson(Map<String, dynamic> json) {
    return WatchAnimeEntry(
      malId: json['mal_id'],
      url: json['url'],
      images: WatchAnimeImages.fromJson(json['images']),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'title': title,
    };
  }
}

class WatchAnimeImages {
  final WatchImageUrls jpg;
  final WatchImageUrls webp;

  WatchAnimeImages({
    required this.jpg,
    required this.webp,
  });

  factory WatchAnimeImages.fromJson(Map<String, dynamic> json) {
    return WatchAnimeImages(
      jpg: WatchImageUrls.fromJson(json['jpg']),
      webp: WatchImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class WatchImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  WatchImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory WatchImageUrls.fromJson(Map<String, dynamic> json) {
    return WatchImageUrls(
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

class WatchEpisode {
  final int malId;
  final String url;
  final String title;
  final bool premium;

  WatchEpisode({
    required this.malId,
    required this.url,
    required this.title,
    required this.premium,
  });

  factory WatchEpisode.fromJson(Map<String, dynamic> json) {
    return WatchEpisode(
      malId: json['mal_id'],
      url: json['url'],
      title: json['title'],
      premium: json['premium'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'title': title,
      'premium': premium,
    };
  }
}
