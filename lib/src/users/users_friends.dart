import '../anime/anime_episodes.dart';

class UsersFriendsResponse {
  final Pagination pagination;
  final List<UsersFriendsData> data;

  UsersFriendsResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersFriendsResponse.fromJson(Map<String, dynamic> json) {
    return UsersFriendsResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => UsersFriendsData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersFriendsData {
  final UsersFriendsUser user;
  final DateTime lastOnline;
  final DateTime? friendsSince;

  UsersFriendsData({
    required this.user,
    required this.lastOnline,
    this.friendsSince,
  });

  factory UsersFriendsData.fromJson(Map<String, dynamic> json) {
    return UsersFriendsData(
      user: UsersFriendsUser.fromJson(json['user'] as Map<String, dynamic>),
      lastOnline: DateTime.parse(json['last_online'] as String),
      friendsSince: json['friends_since'] != null ? DateTime.parse(json['friends_since'] as String) : null,
    );
  }
}

class UsersFriendsUser {
  final String username;
  final String url;
  final UsersFriendsImages images;

  UsersFriendsUser({
    required this.username,
    required this.url,
    required this.images,
  });

  factory UsersFriendsUser.fromJson(Map<String, dynamic> json) {
    return UsersFriendsUser(
      username: json['username'] as String,
      url: json['url'] as String,
      images: UsersFriendsImages.fromJson(json['images'] as Map<String, dynamic>),
    );
  }
}

class UsersFriendsImages {
  final UsersFriendsImageFormat jpg;
  final UsersFriendsImageFormat webp;

  UsersFriendsImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersFriendsImages.fromJson(Map<String, dynamic> json) {
    return UsersFriendsImages(
      jpg: UsersFriendsImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersFriendsImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersFriendsImageFormat {
  final String imageUrl;

  UsersFriendsImageFormat({
    required this.imageUrl,
  });

  factory UsersFriendsImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersFriendsImageFormat(
      imageUrl: json['image_url'] as String,
    );
  }
}
