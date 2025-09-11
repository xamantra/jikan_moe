class UsersExternalResponse {
  final List<UsersExternalData> data;

  UsersExternalResponse({
    required this.data,
  });

  factory UsersExternalResponse.fromJson(Map<String, dynamic> json) {
    return UsersExternalResponse(
      data: (json['data'] as List<dynamic>)
          .map((item) => UsersExternalData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UsersExternalData {
  final String name;
  final String url;

  UsersExternalData({
    required this.name,
    required this.url,
  });

  factory UsersExternalData.fromJson(Map<String, dynamic> json) {
    return UsersExternalData(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
