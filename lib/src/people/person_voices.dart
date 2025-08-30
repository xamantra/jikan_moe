class PersonVoicesResponse {
  final List<PersonVoiceEntry> data;

  PersonVoicesResponse({required this.data});

  factory PersonVoicesResponse.fromJson(Map<String, dynamic> json) {
    return PersonVoicesResponse(
      data: (json['data'] as List).map((item) => PersonVoiceEntry.fromJson(item)).toList(),
    );
  }
}

class PersonVoiceEntry {
  final String role;
  final PersonVoiceAnime anime;
  final PersonVoiceCharacter character;

  PersonVoiceEntry({
    required this.role,
    required this.anime,
    required this.character,
  });

  factory PersonVoiceEntry.fromJson(Map<String, dynamic> json) {
    return PersonVoiceEntry(
      role: json['role'],
      anime: PersonVoiceAnime.fromJson(json['anime']),
      character: PersonVoiceCharacter.fromJson(json['character']),
    );
  }
}

class PersonVoiceAnime {
  final int malId;
  final String url;
  final PersonVoiceImages images;
  final String title;

  PersonVoiceAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory PersonVoiceAnime.fromJson(Map<String, dynamic> json) {
    return PersonVoiceAnime(
      malId: json['mal_id'],
      url: json['url'],
      images: PersonVoiceImages.fromJson(json['images']),
      title: json['title'],
    );
  }
}

class PersonVoiceCharacter {
  final int malId;
  final String url;
  final PersonVoiceCharacterImages images;
  final String name;

  PersonVoiceCharacter({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory PersonVoiceCharacter.fromJson(Map<String, dynamic> json) {
    return PersonVoiceCharacter(
      malId: json['mal_id'],
      url: json['url'],
      images: PersonVoiceCharacterImages.fromJson(json['images']),
      name: json['name'],
    );
  }
}

class PersonVoiceImages {
  final PersonVoiceImageSet jpg;
  final PersonVoiceImageSet webp;

  PersonVoiceImages({required this.jpg, required this.webp});

  factory PersonVoiceImages.fromJson(Map<String, dynamic> json) {
    return PersonVoiceImages(
      jpg: PersonVoiceImageSet.fromJson(json['jpg']),
      webp: PersonVoiceImageSet.fromJson(json['webp']),
    );
  }
}

class PersonVoiceCharacterImages {
  final PersonVoiceCharacterImageSet jpg;
  final PersonVoiceCharacterImageSet webp;

  PersonVoiceCharacterImages({required this.jpg, required this.webp});

  factory PersonVoiceCharacterImages.fromJson(Map<String, dynamic> json) {
    return PersonVoiceCharacterImages(
      jpg: PersonVoiceCharacterImageSet.fromJson(json['jpg']),
      webp: PersonVoiceCharacterImageSet.fromJson(json['webp']),
    );
  }
}

class PersonVoiceImageSet {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  PersonVoiceImageSet({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory PersonVoiceImageSet.fromJson(Map<String, dynamic> json) {
    return PersonVoiceImageSet(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }
}

class PersonVoiceCharacterImageSet {
  final String imageUrl;
  final String? smallImageUrl;

  PersonVoiceCharacterImageSet({
    required this.imageUrl,
    this.smallImageUrl,
  });

  factory PersonVoiceCharacterImageSet.fromJson(Map<String, dynamic> json) {
    return PersonVoiceCharacterImageSet(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
    );
  }
}
