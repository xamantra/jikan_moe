class ClubsDataResponse {
  final ClubsData data;

  ClubsDataResponse({
    required this.data,
  });

  factory ClubsDataResponse.fromJson(Map<String, dynamic> json) {
    return ClubsDataResponse(
      data: ClubsData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ClubsData {
  final int malId;
  final String url;
  final ClubsImages images;
  final String name;
  final int members;
  final String category;
  final DateTime created;
  final String access;

  ClubsData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    required this.members,
    required this.category,
    required this.created,
    required this.access,
  });

  factory ClubsData.fromJson(Map<String, dynamic> json) {
    return ClubsData(
      malId: json['mal_id'],
      url: json['url'],
      images: ClubsImages.fromJson(json['images']),
      name: json['name'],
      members: json['members'],
      category: json['category'],
      created: DateTime.parse(json['created']),
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
      'members': members,
      'category': category,
      'created': created.toIso8601String(),
      'access': access,
    };
  }
}

class ClubsImages {
  final ClubsImagesJpg jpg;

  ClubsImages({
    required this.jpg,
  });

  factory ClubsImages.fromJson(Map<String, dynamic> json) {
    return ClubsImages(
      jpg: ClubsImagesJpg.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class ClubsImagesJpg {
  final String imageUrl;

  ClubsImagesJpg({
    required this.imageUrl,
  });

  factory ClubsImagesJpg.fromJson(Map<String, dynamic> json) {
    return ClubsImagesJpg(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
