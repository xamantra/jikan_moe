import '../anime/anime_episodes.dart';

class UsersSearchResponse {
  final Pagination pagination;
  final List<UsersSearchData> data;

  UsersSearchResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersSearchResponse.fromJson(Map<String, dynamic> json) {
    return UsersSearchResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => UsersSearchData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersSearchData {
  final String username;
  final String url;
  final UsersSearchImages images;
  final DateTime lastOnline;

  UsersSearchData({
    required this.username,
    required this.url,
    required this.images,
    required this.lastOnline,
  });

  factory UsersSearchData.fromJson(Map<String, dynamic> json) {
    return UsersSearchData(
      username: json['username'] as String,
      url: json['url'] as String,
      images: UsersSearchImages.fromJson(json['images'] as Map<String, dynamic>),
      lastOnline: DateTime.parse(json['last_online'] as String),
    );
  }
}

class UsersSearchImages {
  final UsersSearchImageFormat jpg;
  final UsersSearchImageFormat webp;

  UsersSearchImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersSearchImages.fromJson(Map<String, dynamic> json) {
    return UsersSearchImages(
      jpg: UsersSearchImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersSearchImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersSearchImageFormat {
  final String imageUrl;

  UsersSearchImageFormat({
    required this.imageUrl,
  });

  factory UsersSearchImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersSearchImageFormat(
      imageUrl: json['image_url'] as String,
    );
  }
}
