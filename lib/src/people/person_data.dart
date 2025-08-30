// Person images model for basic person data
class PersonDataImages {
  final PersonDataImageJpg jpg;

  PersonDataImages({required this.jpg});

  factory PersonDataImages.fromJson(Map<String, dynamic> json) {
    return PersonDataImages(
      jpg: PersonDataImageJpg.fromJson(json['jpg']),
    );
  }
}

class PersonDataImageJpg {
  final String imageUrl;

  PersonDataImageJpg({required this.imageUrl});

  factory PersonDataImageJpg.fromJson(Map<String, dynamic> json) {
    return PersonDataImageJpg(
      imageUrl: json['image_url'],
    );
  }
}

// Main person data model for basic person endpoint
class PersonData {
  final int malId;
  final String url;
  final String? websiteUrl;
  final PersonDataImages images;
  final String name;
  final String? givenName;
  final String? familyName;
  final List<String> alternateNames;
  final DateTime? birthday;
  final int favorites;
  final String? about;

  PersonData({
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

  factory PersonData.fromJson(Map<String, dynamic> json) {
    return PersonData(
      malId: json['mal_id'],
      url: json['url'],
      websiteUrl: json['website_url'],
      images: PersonDataImages.fromJson(json['images']),
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

// Root response model for basic person endpoint
class PersonDataResponse {
  final PersonData data;

  PersonDataResponse({required this.data});

  factory PersonDataResponse.fromJson(Map<String, dynamic> json) {
    return PersonDataResponse(
      data: PersonData.fromJson(json['data']),
    );
  }
}
