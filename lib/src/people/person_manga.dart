class PersonMangaResponse {
  final List<PersonMangaEntry> data;

  PersonMangaResponse({required this.data});

  factory PersonMangaResponse.fromJson(Map<String, dynamic> json) {
    return PersonMangaResponse(
      data: (json['data'] as List).map((item) => PersonMangaEntry.fromJson(item)).toList(),
    );
  }
}

class PersonMangaEntry {
  final String position;
  final PersonMangaEntryData manga;

  PersonMangaEntry({required this.position, required this.manga});

  factory PersonMangaEntry.fromJson(Map<String, dynamic> json) {
    return PersonMangaEntry(
      position: json['position'],
      manga: PersonMangaEntryData.fromJson(json['manga']),
    );
  }
}

class PersonMangaEntryData {
  final int malId;
  final String url;
  final PersonMangaImages images;
  final String title;

  PersonMangaEntryData({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory PersonMangaEntryData.fromJson(Map<String, dynamic> json) {
    return PersonMangaEntryData(
      malId: json['mal_id'],
      url: json['url'],
      images: PersonMangaImages.fromJson(json['images']),
      title: json['title'],
    );
  }
}

class PersonMangaImages {
  final PersonMangaImageSet jpg;
  final PersonMangaImageSet webp;

  PersonMangaImages({required this.jpg, required this.webp});

  factory PersonMangaImages.fromJson(Map<String, dynamic> json) {
    return PersonMangaImages(
      jpg: PersonMangaImageSet.fromJson(json['jpg']),
      webp: PersonMangaImageSet.fromJson(json['webp']),
    );
  }
}

class PersonMangaImageSet {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  PersonMangaImageSet({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory PersonMangaImageSet.fromJson(Map<String, dynamic> json) {
    return PersonMangaImageSet(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }
}
