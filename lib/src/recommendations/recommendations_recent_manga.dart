import 'package:jikan_moe/jikan_moe.dart';

class RecommendationsRecentMangaResponse {
  final Pagination pagination;
  final List<RecentMangaRecommendationData> data;

  RecommendationsRecentMangaResponse({
    required this.pagination,
    required this.data,
  });

  factory RecommendationsRecentMangaResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationsRecentMangaResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => RecentMangaRecommendationData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class RecentMangaRecommendationData {
  final String malId;
  final List<RecentMangaRecommendationEntry> entry;
  final String content;
  final DateTime date;
  final RecentMangaRecommendationUser user;

  RecentMangaRecommendationData({
    required this.malId,
    required this.entry,
    required this.content,
    required this.date,
    required this.user,
  });

  factory RecentMangaRecommendationData.fromJson(Map<String, dynamic> json) {
    return RecentMangaRecommendationData(
      malId: json['mal_id'] as String,
      entry: (json['entry'] as List<dynamic>).map((item) => RecentMangaRecommendationEntry.fromJson(item as Map<String, dynamic>)).toList(),
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      user: RecentMangaRecommendationUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class RecentMangaRecommendationEntry {
  final int malId;
  final String url;
  final RecentMangaRecommendationImages images;
  final String title;

  RecentMangaRecommendationEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory RecentMangaRecommendationEntry.fromJson(Map<String, dynamic> json) {
    return RecentMangaRecommendationEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: RecentMangaRecommendationImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
    );
  }
}

class RecentMangaRecommendationImages {
  final RecentMangaRecommendationImageUrls jpg;
  final RecentMangaRecommendationImageUrls webp;

  RecentMangaRecommendationImages({
    required this.jpg,
    required this.webp,
  });

  factory RecentMangaRecommendationImages.fromJson(Map<String, dynamic> json) {
    return RecentMangaRecommendationImages(
      jpg: RecentMangaRecommendationImageUrls.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: RecentMangaRecommendationImageUrls.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class RecentMangaRecommendationImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  RecentMangaRecommendationImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory RecentMangaRecommendationImageUrls.fromJson(Map<String, dynamic> json) {
    return RecentMangaRecommendationImageUrls(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}

class RecentMangaRecommendationUser {
  final String url;
  final String username;

  RecentMangaRecommendationUser({
    required this.url,
    required this.username,
  });

  factory RecentMangaRecommendationUser.fromJson(Map<String, dynamic> json) {
    return RecentMangaRecommendationUser(
      url: json['url'] as String,
      username: json['username'] as String,
    );
  }
}
