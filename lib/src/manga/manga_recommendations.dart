import 'index.dart';

class MangaRecommendations {
  final List<MangaRecommendation> data;

  const MangaRecommendations({
    required this.data,
  });

  factory MangaRecommendations.fromJson(Map<String, dynamic> json) {
    return MangaRecommendations(
      data: (json['data'] as List<dynamic>).map((item) => MangaRecommendation.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class MangaRecommendation {
  final MangaRecommendationEntry entry;
  final String url;
  final int votes;

  const MangaRecommendation({
    required this.entry,
    required this.url,
    required this.votes,
  });

  factory MangaRecommendation.fromJson(Map<String, dynamic> json) {
    return MangaRecommendation(
      entry: MangaRecommendationEntry.fromJson(json['entry'] as Map<String, dynamic>),
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

class MangaRecommendationEntry {
  final int malId;
  final String url;
  final MangaImages images;
  final String title;

  const MangaRecommendationEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory MangaRecommendationEntry.fromJson(Map<String, dynamic> json) {
    return MangaRecommendationEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: MangaImages.fromJson(json['images'] as Map<String, dynamic>),
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
