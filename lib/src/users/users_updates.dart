class UsersUpdatesResponse {
  final UsersUpdatesData data;

  UsersUpdatesResponse({
    required this.data,
  });

  factory UsersUpdatesResponse.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesResponse(
      data: UsersUpdatesData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersUpdatesData {
  final List<UsersUpdatesAnime> anime;
  final List<UsersUpdatesManga> manga;

  UsersUpdatesData({
    required this.anime,
    required this.manga,
  });

  factory UsersUpdatesData.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesData(
      anime: (json['anime'] as List<dynamic>).map((item) => UsersUpdatesAnime.fromJson(item as Map<String, dynamic>)).toList(),
      manga: (json['manga'] as List<dynamic>).map((item) => UsersUpdatesManga.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersUpdatesAnime {
  final UsersUpdatesEntry entry;
  final int score;
  final String status;
  final int? episodesSeen;
  final int? episodesTotal;
  final DateTime date;

  UsersUpdatesAnime({
    required this.entry,
    required this.score,
    required this.status,
    this.episodesSeen,
    this.episodesTotal,
    required this.date,
  });

  factory UsersUpdatesAnime.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesAnime(
      entry: UsersUpdatesEntry.fromJson(json['entry'] as Map<String, dynamic>),
      score: json['score'] as int,
      status: json['status'] as String,
      episodesSeen: json['episodes_seen'] as int?,
      episodesTotal: json['episodes_total'] as int?,
      date: DateTime.parse(json['date'] as String),
    );
  }
}

class UsersUpdatesManga {
  final UsersUpdatesEntry entry;
  final int score;
  final String status;
  final int? chaptersRead;
  final int? chaptersTotal;
  final DateTime date;

  UsersUpdatesManga({
    required this.entry,
    required this.score,
    required this.status,
    this.chaptersRead,
    this.chaptersTotal,
    required this.date,
  });

  factory UsersUpdatesManga.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesManga(
      entry: UsersUpdatesEntry.fromJson(json['entry'] as Map<String, dynamic>),
      score: json['score'] as int,
      status: json['status'] as String,
      chaptersRead: json['chapters_read'] as int?,
      chaptersTotal: json['chapters_total'] as int?,
      date: DateTime.parse(json['date'] as String),
    );
  }
}

class UsersUpdatesEntry {
  final int malId;
  final String url;
  final UsersUpdatesImages images;
  final String title;

  UsersUpdatesEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory UsersUpdatesEntry.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersUpdatesImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
    );
  }
}

class UsersUpdatesImages {
  final UsersUpdatesImageFormat jpg;
  final UsersUpdatesImageFormat webp;

  UsersUpdatesImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersUpdatesImages.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesImages(
      jpg: UsersUpdatesImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersUpdatesImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersUpdatesImageFormat {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  UsersUpdatesImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory UsersUpdatesImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersUpdatesImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}
