class RandomUsersData {
  final RandomUserData data;

  RandomUsersData({required this.data});

  factory RandomUsersData.fromJson(Map<String, dynamic> json) {
    return RandomUsersData(
      data: RandomUserData.fromJson(json['data']),
    );
  }
}

class RandomUserData {
  final int malId;
  final String username;
  final String url;
  final RandomUserImages images;
  final DateTime? lastOnline;
  final String? gender;
  final DateTime? birthday;
  final String? location;
  final DateTime joined;

  RandomUserData({
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

  factory RandomUserData.fromJson(Map<String, dynamic> json) {
    return RandomUserData(
      malId: json['mal_id'],
      username: json['username'],
      url: json['url'],
      images: RandomUserImages.fromJson(json['images']),
      lastOnline: json['last_online'] != null ? DateTime.parse(json['last_online']) : null,
      gender: json['gender'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      location: json['location'],
      joined: DateTime.parse(json['joined']),
    );
  }
}

class RandomUserImages {
  final RandomUserImage jpg;
  final RandomUserImage webp;

  RandomUserImages({
    required this.jpg,
    required this.webp,
  });

  factory RandomUserImages.fromJson(Map<String, dynamic> json) {
    return RandomUserImages(
      jpg: RandomUserImage.fromJson(json['jpg']),
      webp: RandomUserImage.fromJson(json['webp']),
    );
  }
}

class RandomUserImage {
  final String? imageUrl;

  RandomUserImage({
    required this.imageUrl,
  });

  factory RandomUserImage.fromJson(Map<String, dynamic> json) {
    return RandomUserImage(
      imageUrl: json['image_url'] as String?,
    );
  }
}
