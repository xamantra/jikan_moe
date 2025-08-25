// Top people data model
class TopPeopleData {
  final int malId;
  final String url;
  final String? websiteUrl;
  final TopPeopleImages images;
  final String name;
  final String? givenName;
  final String? familyName;
  final List<String> alternateNames;
  final DateTime? birthday;
  final int favorites;
  final String? about;

  const TopPeopleData({
    required this.malId,
    required this.url,
    this.websiteUrl,
    required this.images,
    required this.name,
    this.givenName,
    this.familyName,
    required this.alternateNames,
    this.birthday,
    required this.favorites,
    this.about,
  });

  factory TopPeopleData.fromJson(Map<String, dynamic> json) {
    return TopPeopleData(
      malId: json['mal_id'],
      url: json['url'],
      websiteUrl: json['website_url'],
      images: TopPeopleImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'],
      givenName: json['given_name'],
      familyName: json['family_name'],
      alternateNames: (json['alternate_names'] as List).cast<String>(),
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      favorites: json['favorites'],
      about: json['about'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'website_url': websiteUrl,
      'images': images.toJson(),
      'name': name,
      'given_name': givenName,
      'family_name': familyName,
      'alternate_names': alternateNames,
      'birthday': birthday?.toIso8601String(),
      'favorites': favorites,
      'about': about,
    };
  }

  @override
  String toString() {
    return 'TopPeopleData(malId: $malId, name: $name, favorites: $favorites)';
  }
}

// Top people images model
class TopPeopleImages {
  final TopPeopleImageUrls jpg;

  const TopPeopleImages({
    required this.jpg,
  });

  factory TopPeopleImages.fromJson(Map<String, dynamic> json) {
    return TopPeopleImages(
      jpg: TopPeopleImageUrls.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }

  @override
  String toString() {
    return 'TopPeopleImages(jpg: $jpg)';
  }
}

// Top people image URLs model
class TopPeopleImageUrls {
  final String imageUrl;

  const TopPeopleImageUrls({
    required this.imageUrl,
  });

  factory TopPeopleImageUrls.fromJson(Map<String, dynamic> json) {
    return TopPeopleImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }

  @override
  String toString() {
    return 'TopPeopleImageUrls(imageUrl: $imageUrl)';
  }
}

// Top people response model
class TopPeopleResponse {
  final TopPeoplePagination pagination;
  final List<TopPeopleData> data;

  const TopPeopleResponse({
    required this.pagination,
    required this.data,
  });

  factory TopPeopleResponse.fromJson(Map<String, dynamic> json) {
    return TopPeopleResponse(
      pagination: TopPeoplePagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => TopPeopleData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'TopPeopleResponse(pagination: $pagination, data: ${data.length} items)';
  }
}

// Top people pagination model
class TopPeoplePagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final TopPeoplePaginationItems items;

  const TopPeoplePagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory TopPeoplePagination.fromJson(Map<String, dynamic> json) {
    return TopPeoplePagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: TopPeoplePaginationItems.fromJson(json['items'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
      'current_page': currentPage,
      'items': items.toJson(),
    };
  }

  @override
  String toString() {
    return 'TopPeoplePagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage, currentPage: $currentPage, items: $items)';
  }
}

// Top people pagination items model
class TopPeoplePaginationItems {
  final int count;
  final int total;
  final int perPage;

  const TopPeoplePaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory TopPeoplePaginationItems.fromJson(Map<String, dynamic> json) {
    return TopPeoplePaginationItems(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'per_page': perPage,
    };
  }

  @override
  String toString() {
    return 'TopPeoplePaginationItems(count: $count, total: $total, perPage: $perPage)';
  }
}
