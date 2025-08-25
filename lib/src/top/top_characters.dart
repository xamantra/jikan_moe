// Top characters response model
class TopCharactersResponse {
  final TopCharactersPagination pagination;
  final List<TopCharacterData> data;

  const TopCharactersResponse({
    required this.pagination,
    required this.data,
  });

  factory TopCharactersResponse.fromJson(Map<String, dynamic> json) {
    return TopCharactersResponse(
      pagination: TopCharactersPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => TopCharacterData.fromJson(item as Map<String, dynamic>)).toList(),
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
    return 'TopCharactersResponse(pagination: $pagination, data: ${data.length} items)';
  }
}

// Top characters pagination model
class TopCharactersPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final TopCharactersPaginationItems items;

  const TopCharactersPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory TopCharactersPagination.fromJson(Map<String, dynamic> json) {
    return TopCharactersPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: TopCharactersPaginationItems.fromJson(json['items'] as Map<String, dynamic>),
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
    return 'TopCharactersPagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage, currentPage: $currentPage, items: $items)';
  }
}

// Top characters pagination items model
class TopCharactersPaginationItems {
  final int count;
  final int total;
  final int perPage;

  const TopCharactersPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory TopCharactersPaginationItems.fromJson(Map<String, dynamic> json) {
    return TopCharactersPaginationItems(
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
    return 'TopCharactersPaginationItems(count: $count, total: $total, perPage: $perPage)';
  }
}

// Top character data model
class TopCharacterData {
  final int malId;
  final String url;
  final TopCharacterImages images;
  final String name;
  final String? nameKanji;
  final List<String> nicknames;
  final int favorites;
  final String? about;

  const TopCharacterData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    this.nameKanji,
    required this.nicknames,
    required this.favorites,
    this.about,
  });

  factory TopCharacterData.fromJson(Map<String, dynamic> json) {
    return TopCharacterData(
      malId: json['mal_id'],
      url: json['url'],
      images: TopCharacterImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'],
      nameKanji: json['name_kanji'],
      nicknames: (json['nicknames'] as List).cast<String>(),
      favorites: json['favorites'],
      about: json['about'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
      'name_kanji': nameKanji,
      'nicknames': nicknames,
      'favorites': favorites,
      'about': about,
    };
  }

  @override
  String toString() {
    return 'TopCharacterData(malId: $malId, name: $name, favorites: $favorites)';
  }
}

// Top character images model
class TopCharacterImages {
  final TopCharacterImageJpg jpg;
  final TopCharacterImageWebp webp;

  const TopCharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory TopCharacterImages.fromJson(Map<String, dynamic> json) {
    return TopCharacterImages(
      jpg: TopCharacterImageJpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: TopCharacterImageWebp.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }

  @override
  String toString() {
    return 'TopCharacterImages(jpg: $jpg, webp: $webp)';
  }
}

// Top character JPG image model
class TopCharacterImageJpg {
  final String imageUrl;

  const TopCharacterImageJpg({
    required this.imageUrl,
  });

  factory TopCharacterImageJpg.fromJson(Map<String, dynamic> json) {
    return TopCharacterImageJpg(
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
    return 'TopCharacterImageJpg(imageUrl: $imageUrl)';
  }
}

// Top character WebP image model
class TopCharacterImageWebp {
  final String imageUrl;
  final String smallImageUrl;

  const TopCharacterImageWebp({
    required this.imageUrl,
    required this.smallImageUrl,
  });

  factory TopCharacterImageWebp.fromJson(Map<String, dynamic> json) {
    return TopCharacterImageWebp(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
    };
  }

  @override
  String toString() {
    return 'TopCharacterImageWebp(imageUrl: $imageUrl, smallImageUrl: $smallImageUrl)';
  }
}
