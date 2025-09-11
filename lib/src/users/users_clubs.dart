import '../anime/anime_episodes.dart';

class UsersClubsResponse {
  final Pagination pagination;
  final List<UsersClubsData> data;

  UsersClubsResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersClubsResponse.fromJson(Map<String, dynamic> json) {
    return UsersClubsResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => UsersClubsData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersClubsData {
  final int malId;
  final String? name;
  final String url;

  UsersClubsData({
    required this.malId,
    this.name,
    required this.url,
  });

  factory UsersClubsData.fromJson(Map<String, dynamic> json) {
    return UsersClubsData(
      malId: json['mal_id'] as int,
      name: json['name'] as String?,
      url: json['url'] as String,
    );
  }
}
