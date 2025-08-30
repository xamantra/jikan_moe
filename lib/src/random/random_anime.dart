import '../anime/anime_data.dart';

class RandomAnimeData {
  final AnimeData data;

  RandomAnimeData({required this.data});

  factory RandomAnimeData.fromJson(Map<String, dynamic> json) {
    return RandomAnimeData(
      data: AnimeData.fromJson(json['data']),
    );
  }
}
