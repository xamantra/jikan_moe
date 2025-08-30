// Main character data model
class CharacterFullData {
  final int malId;
  final String url;
  final CharacterImages images;
  final String name;
  final String? nameKanji;
  final List<String> nicknames;
  final int favorites;
  final String? about;
  final List<CharacterAnime> anime;
  final List<CharacterManga> manga;
  final List<CharacterVoice> voices;

  CharacterFullData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    this.nameKanji,
    required this.nicknames,
    required this.favorites,
    this.about,
    required this.anime,
    required this.manga,
    required this.voices,
  });

  factory CharacterFullData.fromJson(Map<String, dynamic> json) {
    return CharacterFullData(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterImages.fromJson(json['images']),
      name: json['name'],
      nameKanji: json['name_kanji'],
      nicknames: List<String>.from(json['nicknames']),
      favorites: json['favorites'],
      about: json['about'],
      anime: (json['anime'] as List).map((anime) => CharacterAnime.fromJson(anime)).toList(),
      manga: (json['manga'] as List).map((manga) => CharacterManga.fromJson(manga)).toList(),
      voices: (json['voices'] as List).map((voice) => CharacterVoice.fromJson(voice)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
      'name_kanji': nameKanji,
      'nicknames': nicknames,
      'favorites': favorites,
      'about': about,
      'anime': anime.map((a) => a.toJson()).toList(),
      'manga': manga.map((m) => m.toJson()).toList(),
      'voices': voices.map((v) => v.toJson()).toList(),
    };
  }
}

// Images model
class CharacterImages {
  final CharacterImageUrls jpg;
  final CharacterImageUrls webp;

  CharacterImages({required this.jpg, required this.webp});

  factory CharacterImages.fromJson(Map<String, dynamic> json) {
    return CharacterImages(
      jpg: CharacterImageUrls.fromJson(json['jpg']),
      webp: CharacterImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class CharacterImageUrls {
  final String imageUrl;
  final String? smallImageUrl;

  CharacterImageUrls({required this.imageUrl, this.smallImageUrl});

  factory CharacterImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterImageUrls(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
    };
  }
}

// Character anime model
class CharacterAnime {
  final String role;
  final CharacterAnimeEntry anime;

  CharacterAnime({required this.role, required this.anime});

  factory CharacterAnime.fromJson(Map<String, dynamic> json) {
    return CharacterAnime(
      role: json['role'],
      anime: CharacterAnimeEntry.fromJson(json['anime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'anime': anime.toJson(),
    };
  }
}

class CharacterAnimeEntry {
  final int malId;
  final String url;
  final CharacterMediaImages images;
  final String title;

  CharacterAnimeEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory CharacterAnimeEntry.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeEntry(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterMediaImages.fromJson(json['images']),
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

// Character manga model
class CharacterManga {
  final String role;
  final CharacterMangaEntry manga;

  CharacterManga({required this.role, required this.manga});

  factory CharacterManga.fromJson(Map<String, dynamic> json) {
    return CharacterManga(
      role: json['role'],
      manga: CharacterMangaEntry.fromJson(json['manga']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'manga': manga.toJson(),
    };
  }
}

class CharacterMangaEntry {
  final int malId;
  final String url;
  final CharacterMediaImages images;
  final String title;

  CharacterMangaEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory CharacterMangaEntry.fromJson(Map<String, dynamic> json) {
    return CharacterMangaEntry(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterMediaImages.fromJson(json['images']),
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

// Media images model (shared between anime and manga)
class CharacterMediaImages {
  final CharacterMediaImageUrls jpg;
  final CharacterMediaImageUrls webp;

  CharacterMediaImages({required this.jpg, required this.webp});

  factory CharacterMediaImages.fromJson(Map<String, dynamic> json) {
    return CharacterMediaImages(
      jpg: CharacterMediaImageUrls.fromJson(json['jpg']),
      webp: CharacterMediaImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class CharacterMediaImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  CharacterMediaImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory CharacterMediaImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterMediaImageUrls(
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

// Character voice model
class CharacterVoice {
  final CharacterPerson person;
  final String language;

  CharacterVoice({required this.person, required this.language});

  factory CharacterVoice.fromJson(Map<String, dynamic> json) {
    return CharacterVoice(
      person: CharacterPerson.fromJson(json['person']),
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'language': language,
    };
  }
}

class CharacterPerson {
  final int malId;
  final String url;
  final CharacterPersonImages images;
  final String name;

  CharacterPerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory CharacterPerson.fromJson(Map<String, dynamic> json) {
    return CharacterPerson(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterPersonImages.fromJson(json['images']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
    };
  }
}

class CharacterPersonImages {
  final CharacterPersonImageUrls jpg;

  CharacterPersonImages({required this.jpg});

  factory CharacterPersonImages.fromJson(Map<String, dynamic> json) {
    return CharacterPersonImages(
      jpg: CharacterPersonImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class CharacterPersonImageUrls {
  final String imageUrl;

  CharacterPersonImageUrls({required this.imageUrl});

  factory CharacterPersonImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterPersonImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

// Root response model (for consistency with other endpoints)
class CharacterFullResponse {
  final CharacterFullData data;

  CharacterFullResponse({required this.data});

  factory CharacterFullResponse.fromJson(Map<String, dynamic> json) {
    return CharacterFullResponse(
      data: CharacterFullData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
