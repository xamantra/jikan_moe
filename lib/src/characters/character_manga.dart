// Character manga response model
class CharacterMangaResponse {
  final List<CharacterMangaData> data;

  CharacterMangaResponse({required this.data});

  factory CharacterMangaResponse.fromJson(Map<String, dynamic> json) {
    return CharacterMangaResponse(
      data: (json['data'] as List).map((item) => CharacterMangaData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

// Character manga data model
class CharacterMangaData {
  final String role;
  final CharacterMangaItem manga;

  CharacterMangaData({required this.role, required this.manga});

  factory CharacterMangaData.fromJson(Map<String, dynamic> json) {
    return CharacterMangaData(
      role: json['role'],
      manga: CharacterMangaItem.fromJson(json['manga']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'manga': manga.toJson(),
    };
  }
}

// Character manga item model
class CharacterMangaItem {
  final int malId;
  final String url;
  final CharacterMangaImages images;
  final String title;

  CharacterMangaItem({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory CharacterMangaItem.fromJson(Map<String, dynamic> json) {
    return CharacterMangaItem(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterMangaImages.fromJson(json['images']),
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

// Character manga images model
class CharacterMangaImages {
  final CharacterMangaImageUrls jpg;
  final CharacterMangaImageUrls webp;

  CharacterMangaImages({required this.jpg, required this.webp});

  factory CharacterMangaImages.fromJson(Map<String, dynamic> json) {
    return CharacterMangaImages(
      jpg: CharacterMangaImageUrls.fromJson(json['jpg']),
      webp: CharacterMangaImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

// Character manga image URLs model
class CharacterMangaImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  CharacterMangaImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory CharacterMangaImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterMangaImageUrls(
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
