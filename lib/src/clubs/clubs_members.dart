class ClubsMembersResponse {
  final ClubsPagination pagination;
  final List<ClubsMember> data;

  ClubsMembersResponse({
    required this.pagination,
    required this.data,
  });

  factory ClubsMembersResponse.fromJson(Map<String, dynamic> json) {
    return ClubsMembersResponse(
      pagination: ClubsPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => ClubsMember.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class ClubsMember {
  final String username;
  final String url;
  final ClubsMemberImages images;

  ClubsMember({
    required this.username,
    required this.url,
    required this.images,
  });

  factory ClubsMember.fromJson(Map<String, dynamic> json) {
    return ClubsMember(
      username: json['username'],
      url: json['url'],
      images: ClubsMemberImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'url': url,
      'images': images.toJson(),
    };
  }
}

class ClubsMemberImages {
  final ClubsMemberImagesJpg jpg;
  final ClubsMemberImagesWebp webp;

  ClubsMemberImages({
    required this.jpg,
    required this.webp,
  });

  factory ClubsMemberImages.fromJson(Map<String, dynamic> json) {
    return ClubsMemberImages(
      jpg: ClubsMemberImagesJpg.fromJson(json['jpg']),
      webp: ClubsMemberImagesWebp.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class ClubsMemberImagesJpg {
  final String imageUrl;

  ClubsMemberImagesJpg({
    required this.imageUrl,
  });

  factory ClubsMemberImagesJpg.fromJson(Map<String, dynamic> json) {
    return ClubsMemberImagesJpg(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

class ClubsMemberImagesWebp {
  final String imageUrl;

  ClubsMemberImagesWebp({
    required this.imageUrl,
  });

  factory ClubsMemberImagesWebp.fromJson(Map<String, dynamic> json) {
    return ClubsMemberImagesWebp(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

class ClubsPagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  ClubsPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory ClubsPagination.fromJson(Map<String, dynamic> json) {
    return ClubsPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
    };
  }
}
