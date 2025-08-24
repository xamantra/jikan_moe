import 'index.dart';

// Manga pictures response model
class MangaPicturesResponse {
  final List<MangaImages> data;

  MangaPicturesResponse({required this.data});

  factory MangaPicturesResponse.fromJson(Map<String, dynamic> json) {
    return MangaPicturesResponse(
      data: (json['data'] as List).map((item) => MangaImages.fromJson(item)).toList(),
    );
  }
}
