// Main manga characters response model
class MangaCharactersResponse {
  final List<MangaCharacter> data;

  MangaCharactersResponse({required this.data});

  factory MangaCharactersResponse.fromJson(Map<String, dynamic> json) {
    return MangaCharactersResponse(
      data: (json['data'] as List).map((character) => MangaCharacter.fromJson(character)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((character) => character.toJson()).toList(),
    };
  }
}

// Individual character model
class MangaCharacter {
  final MangaCharacterInfo character;
  final String role;

  MangaCharacter({
    required this.character,
    required this.role,
  });

  factory MangaCharacter.fromJson(Map<String, dynamic> json) {
    return MangaCharacter(
      character: MangaCharacterInfo.fromJson(json['character']),
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character.toJson(),
      'role': role,
    };
  }
}

// Character information model
class MangaCharacterInfo {
  final int malId;
  final String url;
  final MangaCharacterImages images;
  final String name;

  MangaCharacterInfo({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory MangaCharacterInfo.fromJson(Map<String, dynamic> json) {
    return MangaCharacterInfo(
      malId: json['mal_id'],
      url: json['url'],
      images: MangaCharacterImages.fromJson(json['images']),
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

// Character images model
class MangaCharacterImages {
  final MangaCharacterImageUrls jpg;
  final MangaCharacterImageUrls webp;

  MangaCharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory MangaCharacterImages.fromJson(Map<String, dynamic> json) {
    return MangaCharacterImages(
      jpg: MangaCharacterImageUrls.fromJson(json['jpg']),
      webp: MangaCharacterImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

// Character image URLs model
class MangaCharacterImageUrls {
  final String imageUrl;
  final String? smallImageUrl;

  MangaCharacterImageUrls({
    required this.imageUrl,
    this.smallImageUrl,
  });

  factory MangaCharacterImageUrls.fromJson(Map<String, dynamic> json) {
    return MangaCharacterImageUrls(
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
