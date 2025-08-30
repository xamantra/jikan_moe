import 'package:jikan_moe/jikan_moe.dart';

class RecommendationsRecentAnimeResponse {
  final Pagination pagination;
  final List<RecommendationData> data;

  RecommendationsRecentAnimeResponse({
    required this.pagination,
    required this.data,
  });

  factory RecommendationsRecentAnimeResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationsRecentAnimeResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((item) => RecommendationData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RecommendationData {
  final String malId;
  final List<RecommendationEntry> entry;
  final String content;
  final DateTime date;
  final RecommendationUser user;

  RecommendationData({
    required this.malId,
    required this.entry,
    required this.content,
    required this.date,
    required this.user,
  });

  factory RecommendationData.fromJson(Map<String, dynamic> json) {
    return RecommendationData(
      malId: json['mal_id'] as String,
      entry: (json['entry'] as List<dynamic>)
          .map((item) => RecommendationEntry.fromJson(item as Map<String, dynamic>))
          .toList(),
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      user: RecommendationUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class RecommendationEntry {
  final int malId;
  final String url;
  final RecommendationImages images;
  final String title;

  RecommendationEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory RecommendationEntry.fromJson(Map<String, dynamic> json) {
    return RecommendationEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: RecommendationImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
    );
  }
}

class RecommendationImages {
  final RecommendationImageUrls jpg;
  final RecommendationImageUrls webp;

  RecommendationImages({
    required this.jpg,
    required this.webp,
  });

  factory RecommendationImages.fromJson(Map<String, dynamic> json) {
    return RecommendationImages(
      jpg: RecommendationImageUrls.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: RecommendationImageUrls.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class RecommendationImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  RecommendationImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory RecommendationImageUrls.fromJson(Map<String, dynamic> json) {
    return RecommendationImageUrls(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}

class RecommendationUser {
  final String url;
  final String username;

  RecommendationUser({
    required this.url,
    required this.username,
  });

  factory RecommendationUser.fromJson(Map<String, dynamic> json) {
    return RecommendationUser(
      url: json['url'] as String,
      username: json['username'] as String,
    );
  }
}
