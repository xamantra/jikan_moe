class PersonAnimeResponse {
  final List<PersonAnimeEntry> data;

  PersonAnimeResponse({required this.data});

  factory PersonAnimeResponse.fromJson(Map<String, dynamic> json) {
    return PersonAnimeResponse(
      data: (json['data'] as List).map((item) => PersonAnimeEntry.fromJson(item)).toList(),
    );
  }
}

class PersonAnimeEntry {
  final String position;
  final PersonAnimeEntryData anime;

  PersonAnimeEntry({required this.position, required this.anime});

  factory PersonAnimeEntry.fromJson(Map<String, dynamic> json) {
    return PersonAnimeEntry(
      position: json['position'],
      anime: PersonAnimeEntryData.fromJson(json['anime']),
    );
  }
}

class PersonAnimeEntryData {
  final int malId;
  final String url;
  final PersonAnimeImages images;
  final String title;

  PersonAnimeEntryData({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory PersonAnimeEntryData.fromJson(Map<String, dynamic> json) {
    return PersonAnimeEntryData(
      malId: json['mal_id'],
      url: json['url'],
      images: PersonAnimeImages.fromJson(json['images']),
      title: json['title'],
    );
  }
}

class PersonAnimeImages {
  final PersonAnimeImageSet jpg;
  final PersonAnimeImageSet webp;

  PersonAnimeImages({required this.jpg, required this.webp});

  factory PersonAnimeImages.fromJson(Map<String, dynamic> json) {
    return PersonAnimeImages(
      jpg: PersonAnimeImageSet.fromJson(json['jpg']),
      webp: PersonAnimeImageSet.fromJson(json['webp']),
    );
  }
}

class PersonAnimeImageSet {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  PersonAnimeImageSet({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory PersonAnimeImageSet.fromJson(Map<String, dynamic> json) {
    return PersonAnimeImageSet(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }
}
