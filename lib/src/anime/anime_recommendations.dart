import 'index.dart';

class AnimeRecommendations {
  final List<AnimeRecommendation> data;

  const AnimeRecommendations({
    required this.data,
  });

  factory AnimeRecommendations.fromJson(Map<String, dynamic> json) {
    return AnimeRecommendations(
      data: (json['data'] as List<dynamic>).map((item) => AnimeRecommendation.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class AnimeRecommendation {
  final AnimeRecommendationEntry entry;
  final String url;
  final int votes;

  const AnimeRecommendation({
    required this.entry,
    required this.url,
    required this.votes,
  });

  factory AnimeRecommendation.fromJson(Map<String, dynamic> json) {
    return AnimeRecommendation(
      entry: AnimeRecommendationEntry.fromJson(json['entry'] as Map<String, dynamic>),
      url: json['url'] as String,
      votes: json['votes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entry': entry.toJson(),
      'url': url,
      'votes': votes,
    };
  }
}

class AnimeRecommendationEntry {
  final int malId;
  final String url;
  final AnimeImages images;
  final String title;

  const AnimeRecommendationEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory AnimeRecommendationEntry.fromJson(Map<String, dynamic> json) {
    return AnimeRecommendationEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: AnimeImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
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
