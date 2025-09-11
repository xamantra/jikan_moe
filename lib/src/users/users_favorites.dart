class UsersFavoritesResponse {
  final UsersFavoritesData data;

  UsersFavoritesResponse({
    required this.data,
  });

  factory UsersFavoritesResponse.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesResponse(
      data: UsersFavoritesData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersFavoritesData {
  final List<UsersFavoritesAnime> anime;
  final List<UsersFavoritesManga> manga;
  final List<UsersFavoritesCharacter> characters;
  final List<UsersFavoritesPerson> people;

  UsersFavoritesData({
    required this.anime,
    required this.manga,
    required this.characters,
    required this.people,
  });

  factory UsersFavoritesData.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesData(
      anime: (json['anime'] as List<dynamic>)
          .map((item) => UsersFavoritesAnime.fromJson(item as Map<String, dynamic>))
          .toList(),
      manga: (json['manga'] as List<dynamic>)
          .map((item) => UsersFavoritesManga.fromJson(item as Map<String, dynamic>))
          .toList(),
      characters: (json['characters'] as List<dynamic>)
          .map((item) => UsersFavoritesCharacter.fromJson(item as Map<String, dynamic>))
          .toList(),
      people: (json['people'] as List<dynamic>)
          .map((item) => UsersFavoritesPerson.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UsersFavoritesAnime {
  final int malId;
  final String url;
  final UsersFavoritesImages images;
  final String title;
  final String type;
  final int? startYear;

  UsersFavoritesAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.type,
    this.startYear,
  });

  factory UsersFavoritesAnime.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesAnime(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFavoritesImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: json['type'] as String,
      startYear: json['start_year'] as int?,
    );
  }
}

class UsersFavoritesManga {
  final int malId;
  final String url;
  final UsersFavoritesImages images;
  final String title;
  final String type;
  final int? startYear;

  UsersFavoritesManga({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.type,
    this.startYear,
  });

  factory UsersFavoritesManga.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesManga(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFavoritesImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: json['type'] as String,
      startYear: json['start_year'] as int?,
    );
  }
}

class UsersFavoritesCharacter {
  final int malId;
  final String url;
  final UsersFavoritesCharacterImages images;
  final String name;

  UsersFavoritesCharacter({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory UsersFavoritesCharacter.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesCharacter(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFavoritesCharacterImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }
}

class UsersFavoritesPerson {
  final int malId;
  final String url;
  final UsersFavoritesPersonImages images;
  final String name;

  UsersFavoritesPerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory UsersFavoritesPerson.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesPerson(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersFavoritesPersonImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }
}

class UsersFavoritesImages {
  final UsersFavoritesImageFormat jpg;
  final UsersFavoritesImageFormat webp;

  UsersFavoritesImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersFavoritesImages.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesImages(
      jpg: UsersFavoritesImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersFavoritesImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersFavoritesImageFormat {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  UsersFavoritesImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory UsersFavoritesImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}

class UsersFavoritesCharacterImages {
  final UsersFavoritesCharacterImageFormat jpg;
  final UsersFavoritesCharacterImageFormat webp;

  UsersFavoritesCharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersFavoritesCharacterImages.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesCharacterImages(
      jpg: UsersFavoritesCharacterImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersFavoritesCharacterImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersFavoritesCharacterImageFormat {
  final String imageUrl;
  final String? smallImageUrl;

  UsersFavoritesCharacterImageFormat({
    required this.imageUrl,
    this.smallImageUrl,
  });

  factory UsersFavoritesCharacterImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesCharacterImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String?,
    );
  }
}

class UsersFavoritesPersonImages {
  final UsersFavoritesPersonImageFormat jpg;

  UsersFavoritesPersonImages({
    required this.jpg,
  });

  factory UsersFavoritesPersonImages.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesPersonImages(
      jpg: UsersFavoritesPersonImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }
}

class UsersFavoritesPersonImageFormat {
  final String imageUrl;

  UsersFavoritesPersonImageFormat({
    required this.imageUrl,
  });

  factory UsersFavoritesPersonImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFavoritesPersonImageFormat(
      imageUrl: json['image_url'] as String,
    );
  }
}
