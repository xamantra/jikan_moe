import '../anime/anime_episodes.dart';

class UsersRecommendationsResponse {
  final Pagination pagination;
  final List<UsersRecommendationData> data;

  UsersRecommendationsResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationsResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => UsersRecommendationData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersRecommendationData {
  final String malId;
  final List<UsersRecommendationEntry> entry;
  final String content;
  final DateTime date;
  final UsersRecommendationUser user;

  UsersRecommendationData({
    required this.malId,
    required this.entry,
    required this.content,
    required this.date,
    required this.user,
  });

  factory UsersRecommendationData.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationData(
      malId: json['mal_id'] as String,
      entry: (json['entry'] as List<dynamic>).map((item) => UsersRecommendationEntry.fromJson(item as Map<String, dynamic>)).toList(),
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      user: UsersRecommendationUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class UsersRecommendationEntry {
  final int malId;
  final String url;
  final UsersRecommendationEntryImages images;
  final String title;

  UsersRecommendationEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory UsersRecommendationEntry.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersRecommendationEntryImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
    );
  }
}

class UsersRecommendationEntryImages {
  final UsersRecommendationEntryImageFormat jpg;
  final UsersRecommendationEntryImageFormat webp;

  UsersRecommendationEntryImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersRecommendationEntryImages.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationEntryImages(
      jpg: UsersRecommendationEntryImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersRecommendationEntryImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersRecommendationEntryImageFormat {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  UsersRecommendationEntryImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory UsersRecommendationEntryImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationEntryImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}

class UsersRecommendationUser {
  final String url;
  final String username;

  UsersRecommendationUser({
    required this.url,
    required this.username,
  });

  factory UsersRecommendationUser.fromJson(Map<String, dynamic> json) {
    return UsersRecommendationUser(
      url: json['url'] as String,
      username: json['username'] as String,
    );
  }
}
