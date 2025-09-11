class UsersAboutResponse {
  final UsersAboutData data;

  UsersAboutResponse({
    required this.data,
  });

  factory UsersAboutResponse.fromJson(Map<String, dynamic> json) {
    return UsersAboutResponse(
      data: UsersAboutData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersAboutData {
  final String? about;

  UsersAboutData({
    this.about,
  });

  factory UsersAboutData.fromJson(Map<String, dynamic> json) {
    return UsersAboutData(
      about: json['about'] as String?,
    );
  }
}
