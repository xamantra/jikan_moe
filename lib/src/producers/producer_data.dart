import 'producer_full.dart';

// Producer data model
class ProducerData {
  final int malId;
  final String url;
  final List<ProducerTitle> titles;
  final ProducerImages images;
  final int favorites;
  final DateTime? established;
  final String? about;
  final int count;

  ProducerData({
    required this.malId,
    required this.url,
    required this.titles,
    required this.images,
    required this.favorites,
    this.established,
    this.about,
    required this.count,
  });

  factory ProducerData.fromJson(Map<String, dynamic> json) {
    return ProducerData(
      malId: json['mal_id'],
      url: json['url'],
      titles: (json['titles'] as List).map((title) => ProducerTitle.fromJson(title)).toList(),
      images: ProducerImages.fromJson(json['images']),
      favorites: json['favorites'],
      established: json['established'] != null ? DateTime.parse(json['established']) : null,
      about: json['about'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'titles': titles.map((title) => title.toJson()).toList(),
      'images': images.toJson(),
      'favorites': favorites,
      'established': established?.toIso8601String(),
      'about': about,
      'count': count,
    };
  }
}
