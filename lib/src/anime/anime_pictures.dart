import 'index.dart';

// Anime pictures response model
class AnimePicturesResponse {
  final List<AnimePicturesData> data;

  AnimePicturesResponse({required this.data});

  factory AnimePicturesResponse.fromJson(Map<String, dynamic> json) {
    return AnimePicturesResponse(
      data: (json['data'] as List).map((item) => AnimePicturesData.fromJson(item)).toList(),
    );
  }
}

// Individual anime picture data model
class AnimePicturesData {
  final AnimeImageUrls jpg;
  final AnimeImageUrls webp;

  AnimePicturesData({required this.jpg, required this.webp});

  factory AnimePicturesData.fromJson(Map<String, dynamic> json) {
    return AnimePicturesData(
      jpg: AnimeImageUrls.fromJson(json['jpg']),
      webp: AnimeImageUrls.fromJson(json['webp']),
    );
  }
}
