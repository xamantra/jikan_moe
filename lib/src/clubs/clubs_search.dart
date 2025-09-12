class ClubsSearchResponse {
  final ClubsSearchPagination pagination;
  final List<ClubsSearchData> data;

  ClubsSearchResponse({
    required this.pagination,
    required this.data,
  });

  factory ClubsSearchResponse.fromJson(Map<String, dynamic> json) {
    return ClubsSearchResponse(
      pagination: ClubsSearchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => ClubsSearchData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class ClubsSearchPagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  ClubsSearchPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory ClubsSearchPagination.fromJson(Map<String, dynamic> json) {
    return ClubsSearchPagination(
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

class ClubsSearchData {
  final int malId;
  final String url;
  final ClubsSearchImages images;
  final String name;
  final int members;
  final String category;
  final DateTime created;
  final String access;

  ClubsSearchData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    required this.members,
    required this.category,
    required this.created,
    required this.access,
  });

  factory ClubsSearchData.fromJson(Map<String, dynamic> json) {
    return ClubsSearchData(
      malId: json['mal_id'],
      url: json['url'],
      images: ClubsSearchImages.fromJson(json['images']),
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

class ClubsSearchImages {
  final ClubsSearchImageUrls jpg;

  ClubsSearchImages({
    required this.jpg,
  });

  factory ClubsSearchImages.fromJson(Map<String, dynamic> json) {
    return ClubsSearchImages(
      jpg: ClubsSearchImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class ClubsSearchImageUrls {
  final String imageUrl;

  ClubsSearchImageUrls({
    required this.imageUrl,
  });

  factory ClubsSearchImageUrls.fromJson(Map<String, dynamic> json) {
    return ClubsSearchImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
