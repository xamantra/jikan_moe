class UsersFullResponse {
  final UsersFullData data;

  UsersFullResponse({
    required this.data,
  });

  factory UsersFullResponse.fromJson(Map<String, dynamic> json) {
    return UsersFullResponse(
      data: UsersFullData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersFullData {
  final int malId;
  final String username;
  final String url;
  final UsersFullImages images;
  final DateTime? lastOnline;
  final String? gender;
  final String? birthday;
  final String? location;
  final DateTime joined;
  final UsersFullStatistics statistics;
  final UsersFullFavorites favorites;
  final String? updates;
  final String? about;
  final List<UsersFullExternal>? external;

  UsersFullData({
    required this.malId,
    required this.username,
    required this.url,
    required this.images,
    this.lastOnline,
    this.gender,
    this.birthday,
    this.location,
    required this.joined,
    required this.statistics,
    required this.favorites,
    this.updates,
    this.about,
    this.external,
  });

  factory UsersFullData.fromJson(Map<String, dynamic> json) {
    return UsersFullData(
      malId: json['mal_id'] as int,
      username: json['username'] as String,
      url: json['url'] as String,
      images: UsersFullImages.fromJson(json['images'] as Map<String, dynamic>),
      lastOnline: json['last_online'] != null ? DateTime.parse(json['last_online'] as String) : null,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      location: json['location'] as String?,
      joined: DateTime.parse(json['joined'] as String),
      statistics: UsersFullStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
      favorites: UsersFullFavorites.fromJson(json['favorites'] as Map<String, dynamic>),
      updates: json['updates'] as String?,
      about: json['about'] as String?,
      external: json['external'] != null ? (json['external'] as List<dynamic>).map((item) => UsersFullExternal.fromJson(item as Map<String, dynamic>)).toList() : null,
    );
  }
}

class UsersFullImages {
  final UsersFullImageFormat jpg;
  final UsersFullImageFormat webp;

  UsersFullImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersFullImages.fromJson(Map<String, dynamic> json) {
    return UsersFullImages(
      jpg: UsersFullImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersFullImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersFullImageFormat {
  final String? imageUrl;

  UsersFullImageFormat({
    this.imageUrl,
  });

  factory UsersFullImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFullImageFormat(
      imageUrl: json['image_url'] as String?,
    );
  }
}

class UsersFullStatistics {
  final UsersFullAnimeStatistics anime;
  final UsersFullMangaStatistics manga;

  UsersFullStatistics({
    required this.anime,
    required this.manga,
  });

  factory UsersFullStatistics.fromJson(Map<String, dynamic> json) {
    return UsersFullStatistics(
      anime: UsersFullAnimeStatistics.fromJson(json['anime'] as Map<String, dynamic>),
      manga: UsersFullMangaStatistics.fromJson(json['manga'] as Map<String, dynamic>),
    );
  }
}

class UsersFullAnimeStatistics {
  final double daysWatched;
  final double meanScore;
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;
  final int totalEntries;
  final int rewatched;
  final int episodesWatched;

  UsersFullAnimeStatistics({
    required this.daysWatched,
    required this.meanScore,
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
    required this.totalEntries,
    required this.rewatched,
    required this.episodesWatched,
  });

  factory UsersFullAnimeStatistics.fromJson(Map<String, dynamic> json) {
    return UsersFullAnimeStatistics(
      daysWatched: (json['days_watched'] as num).toDouble(),
      meanScore: (json['mean_score'] as num).toDouble(),
      watching: json['watching'] as int,
      completed: json['completed'] as int,
      onHold: json['on_hold'] as int,
      dropped: json['dropped'] as int,
      planToWatch: json['plan_to_watch'] as int,
      totalEntries: json['total_entries'] as int,
      rewatched: json['rewatched'] as int,
      episodesWatched: json['episodes_watched'] as int,
    );
  }
}

class UsersFullMangaStatistics {
  final double daysRead;
  final double meanScore;
  final int reading;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToRead;
  final int totalEntries;
  final int reread;
  final int chaptersRead;
  final int volumesRead;

  UsersFullMangaStatistics({
    required this.daysRead,
    required this.meanScore,
    required this.reading,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToRead,
    required this.totalEntries,
    required this.reread,
    required this.chaptersRead,
    required this.volumesRead,
  });

  factory UsersFullMangaStatistics.fromJson(Map<String, dynamic> json) {
    return UsersFullMangaStatistics(
      daysRead: (json['days_read'] as num).toDouble(),
      meanScore: (json['mean_score'] as num).toDouble(),
      reading: json['reading'] as int,
      completed: json['completed'] as int,
      onHold: json['on_hold'] as int,
      dropped: json['dropped'] as int,
      planToRead: json['plan_to_read'] as int,
      totalEntries: json['total_entries'] as int,
      reread: json['reread'] as int,
      chaptersRead: json['chapters_read'] as int,
      volumesRead: json['volumes_read'] as int,
    );
  }
}

class UsersFullFavorites {
  final List<UsersFullFavoriteAnime> anime;
  final List<UsersFullFavoriteManga> manga;
  final List<UsersFullFavoriteCharacter> characters;
  final List<UsersFullFavoritePerson> people;

  UsersFullFavorites({
    required this.anime,
    required this.manga,
    required this.characters,
    required this.people,
  });

  factory UsersFullFavorites.fromJson(Map<String, dynamic> json) {
    return UsersFullFavorites(
      anime: (json['anime'] as List<dynamic>).map((item) => UsersFullFavoriteAnime.fromJson(item as Map<String, dynamic>)).toList(),
      manga: (json['manga'] as List<dynamic>).map((item) => UsersFullFavoriteManga.fromJson(item as Map<String, dynamic>)).toList(),
      characters: (json['characters'] as List<dynamic>).map((item) => UsersFullFavoriteCharacter.fromJson(item as Map<String, dynamic>)).toList(),
      people: (json['people'] as List<dynamic>).map((item) => UsersFullFavoritePerson.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersFullFavoriteAnime {
  final int malId;
  final String url;
  final UsersFullFavoriteImages images;
  final String title;
  final String type;
  final int? startYear;

  UsersFullFavoriteAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.type,
    this.startYear,
  });

  factory UsersFullFavoriteAnime.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoriteAnime(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFullFavoriteImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: json['type'] as String,
      startYear: json['start_year'] as int?,
    );
  }
}

class UsersFullFavoriteManga {
  final int malId;
  final String url;
  final UsersFullFavoriteImages images;
  final String title;
  final String type;
  final int? startYear;

  UsersFullFavoriteManga({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.type,
    this.startYear,
  });

  factory UsersFullFavoriteManga.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoriteManga(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFullFavoriteImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: json['type'] as String,
      startYear: json['start_year'] as int?,
    );
  }
}

class UsersFullFavoriteCharacter {
  final int malId;
  final String url;
  final UsersFullFavoriteImages images;
  final String name;

  UsersFullFavoriteCharacter({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory UsersFullFavoriteCharacter.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoriteCharacter(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFullFavoriteImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }
}

class UsersFullFavoritePerson {
  final int malId;
  final String url;
  final UsersFullFavoriteImages images;
  final String name;

  UsersFullFavoritePerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory UsersFullFavoritePerson.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoritePerson(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFullFavoriteImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }
}

class UsersFullFavoriteImages {
  final UsersFullFavoriteImageFormat jpg;
  final UsersFullFavoriteImageFormat webp;

  UsersFullFavoriteImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersFullFavoriteImages.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoriteImages(
      jpg: UsersFullFavoriteImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersFullFavoriteImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersFullFavoriteImageFormat {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  UsersFullFavoriteImageFormat({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory UsersFullFavoriteImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFullFavoriteImageFormat(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );
  }
}

class UsersFullExternal {
  final String name;
  final String url;

  UsersFullExternal({
    required this.name,
    required this.url,
  });

  factory UsersFullExternal.fromJson(Map<String, dynamic> json) {
    return UsersFullExternal(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
