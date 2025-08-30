// Character pictures response model
class CharacterPicturesResponse {
  final List<CharacterPicturesData> data;

  CharacterPicturesResponse({required this.data});

  factory CharacterPicturesResponse.fromJson(Map<String, dynamic> json) {
    return CharacterPicturesResponse(
      data: (json['data'] as List).map((item) => CharacterPicturesData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

// Individual character picture data model
class CharacterPicturesData {
  final CharacterPictureImageUrls jpg;

  CharacterPicturesData({required this.jpg});

  factory CharacterPicturesData.fromJson(Map<String, dynamic> json) {
    return CharacterPicturesData(
      jpg: CharacterPictureImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

// Character picture image URLs model
class CharacterPictureImageUrls {
  final String imageUrl;

  CharacterPictureImageUrls({required this.imageUrl});

  factory CharacterPictureImageUrls.fromJson(Map<String, dynamic> json) {
    return CharacterPictureImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
