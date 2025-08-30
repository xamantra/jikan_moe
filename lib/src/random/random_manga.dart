import '../manga/manga_data.dart';

class RandomMangaData {
  final MangaData data;

  RandomMangaData({required this.data});

  factory RandomMangaData.fromJson(Map<String, dynamic> json) {
    return RandomMangaData(
      data: MangaData.fromJson(json['data']),
    );
  }
}
