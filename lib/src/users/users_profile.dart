class UsersProfileResponse {
  final UsersProfileData data;

  UsersProfileResponse({
    required this.data,
  });

  factory UsersProfileResponse.fromJson(Map<String, dynamic> json) {
    return UsersProfileResponse(
      data: UsersProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersProfileData {
  final int malId;
  final String username;
  final String url;
  final UsersProfileImages images;
  final DateTime? lastOnline;
  final String? gender;
  final String? birthday;
  final String? location;
  final DateTime joined;

  UsersProfileData({
    required this.malId,
    required this.username,
    required this.url,
    required this.images,
    this.lastOnline,
    this.gender,
    this.birthday,
    this.location,
    required this.joined,
  });

  factory UsersProfileData.fromJson(Map<String, dynamic> json) {
    return UsersProfileData(
      malId: json['mal_id'] as int,
      username: json['username'] as String,
      url: json['url'] as String,
      images: UsersProfileImages.fromJson(json['images'] as Map<String, dynamic>),
      lastOnline: json['last_online'] != null ? DateTime.parse(json['last_online'] as String) : null,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      location: json['location'] as String?,
      joined: DateTime.parse(json['joined'] as String),
    );
  }
}

class UsersProfileImages {
  final UsersProfileImageFormat jpg;
  final UsersProfileImageFormat webp;

  UsersProfileImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersProfileImages.fromJson(Map<String, dynamic> json) {
    return UsersProfileImages(
      jpg: UsersProfileImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersProfileImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersProfileImageFormat {
  final String? imageUrl;

  UsersProfileImageFormat({
    this.imageUrl,
  });

  factory UsersProfileImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersProfileImageFormat(
      imageUrl: json['image_url'] as String?,
    );
  }
}
