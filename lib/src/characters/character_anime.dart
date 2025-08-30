// Character anime response model
class CharacterAnimeResponse {
  final List<CharacterAnimeData> data;

  CharacterAnimeResponse({required this.data});

  factory CharacterAnimeResponse.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeResponse(
      data: (json['data'] as List).map((item) => CharacterAnimeData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

// Character anime data model
class CharacterAnimeData {
  final String role;
  final CharacterAnimeItem anime;

  CharacterAnimeData({required this.role, required this.anime});

  factory CharacterAnimeData.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeData(
      role: json['role'],
      anime: CharacterAnimeItem.fromJson(json['anime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'anime': anime.toJson(),
    };
  }
}

// Character anime item model
class CharacterAnimeItem {
  final int malId;
  final String url;
  final CharacterAnimeImages images;
  final String title;

  CharacterAnimeItem({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory CharacterAnimeItem.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeItem(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterAnimeImages.fromJson(json['images']),
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

// Character anime images model
class CharacterAnimeImages {
  final CharacterAnimeImageUrls jpg;
  final CharacterAnimeImageUrls webp;

  CharacterAnimeImages({required this.jpg, required this.webp});

  factory CharacterAnimeImages.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeImages(
      jpg: CharacterAnimeImageUrls.fromJson(json['jpg']),
      webp: CharacterAnimeImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

// Character anime image URLs model
class CharacterAnimeImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  CharacterAnimeImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory CharacterAnimeImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterAnimeImageUrls(
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
