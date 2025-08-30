// People search response models
class PeopleSearchResponse {
  final PeoplePagination pagination;
  final List<PersonSearchData> data;

  PeopleSearchResponse({required this.pagination, required this.data});

  factory PeopleSearchResponse.fromJson(Map<String, dynamic> json) {
    return PeopleSearchResponse(
      pagination: PeoplePagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => PersonSearchData.fromJson(item)).toList(),
    );
  }
}

class PeoplePagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final PeoplePaginationItems items;

  PeoplePagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory PeoplePagination.fromJson(Map<String, dynamic> json) {
    return PeoplePagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: PeoplePaginationItems.fromJson(json['items']),
    );
  }
}

class PeoplePaginationItems {
  final int count;
  final int total;
  final int perPage;

  PeoplePaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory PeoplePaginationItems.fromJson(Map<String, dynamic> json) {
    return PeoplePaginationItems(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }
}

class PersonSearchData {
  final int malId;
  final String url;
  final String? websiteUrl;
  final PersonSearchImages images;
  final String name;
  final String? givenName;
  final String? familyName;
  final List<String> alternateNames;
  final DateTime? birthday;
  final int favorites;
  final String? about;

  PersonSearchData({
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

  factory PersonSearchData.fromJson(Map<String, dynamic> json) {
    return PersonSearchData(
      malId: json['mal_id'],
      url: json['url'],
      websiteUrl: json['website_url'],
      images: PersonSearchImages.fromJson(json['images']),
      name: json['name'],
      givenName: json['given_name'],
      familyName: json['family_name'],
      alternateNames: List<String>.from(json['alternate_names']),
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      favorites: json['favorites'],
      about: json['about'],
    );
  }
}

class PersonSearchImages {
  final PersonSearchImageJpg jpg;

  PersonSearchImages({required this.jpg});

  factory PersonSearchImages.fromJson(Map<String, dynamic> json) {
    return PersonSearchImages(
      jpg: PersonSearchImageJpg.fromJson(json['jpg']),
    );
  }
}

class PersonSearchImageJpg {
  final String imageUrl;

  PersonSearchImageJpg({required this.imageUrl});

  factory PersonSearchImageJpg.fromJson(Map<String, dynamic> json) {
    return PersonSearchImageJpg(
      imageUrl: json['image_url'],
    );
  }
}
