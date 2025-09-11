import '../anime/anime_episodes.dart';

class UsersIdResponse {
  final Pagination pagination;
  final UsersIdData data;

  UsersIdResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersIdResponse.fromJson(Map<String, dynamic> json) {
    return UsersIdResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: UsersIdData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersIdData {
  final String url;
  final String username;

  UsersIdData({
    required this.url,
    required this.username,
  });

  factory UsersIdData.fromJson(Map<String, dynamic> json) {
    return UsersIdData(
      url: json['url'] as String,
      username: json['username'] as String,
    );
  }
}
