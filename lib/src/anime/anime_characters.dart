// Main anime characters response model
class AnimeCharactersResponse {
  final List<AnimeCharacter> data;

  AnimeCharactersResponse({required this.data});

  factory AnimeCharactersResponse.fromJson(Map<String, dynamic> json) {
    return AnimeCharactersResponse(
      data: (json['data'] as List).map((character) => AnimeCharacter.fromJson(character)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((character) => character.toJson()).toList(),
    };
  }
}

// Individual character model
class AnimeCharacter {
  final AnimeCharacterInfo character;
  final String role;
  final int favorites;
  final List<AnimeVoiceActor> voiceActors;

  AnimeCharacter({
    required this.character,
    required this.role,
    required this.favorites,
    required this.voiceActors,
  });

  factory AnimeCharacter.fromJson(Map<String, dynamic> json) {
    return AnimeCharacter(
      character: AnimeCharacterInfo.fromJson(json['character']),
      role: json['role'],
      favorites: json['favorites'],
      voiceActors: (json['voice_actors'] as List).map((actor) => AnimeVoiceActor.fromJson(actor)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character.toJson(),
      'role': role,
      'favorites': favorites,
      'voice_actors': voiceActors.map((actor) => actor.toJson()).toList(),
    };
  }
}

// Character information model
class AnimeCharacterInfo {
  final int malId;
  final String url;
  final AnimeCharacterImages images;
  final String name;

  AnimeCharacterInfo({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory AnimeCharacterInfo.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterInfo(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeCharacterImages.fromJson(json['images']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
    };
  }
}

// Character images model
class AnimeCharacterImages {
  final AnimeCharacterImageUrls jpg;
  final AnimeCharacterImageUrls webp;

  AnimeCharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory AnimeCharacterImages.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterImages(
      jpg: AnimeCharacterImageUrls.fromJson(json['jpg']),
      webp: AnimeCharacterImageUrls.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

// Character image URLs model
class AnimeCharacterImageUrls {
  final String imageUrl;
  final String? smallImageUrl;

  AnimeCharacterImageUrls({
    required this.imageUrl,
    this.smallImageUrl,
  });

  factory AnimeCharacterImageUrls.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterImageUrls(
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
}

// Voice actor model
class AnimeVoiceActor {
  final AnimePerson person;
  final String language;

  AnimeVoiceActor({
    required this.person,
    required this.language,
  });

  factory AnimeVoiceActor.fromJson(Map<String, dynamic> json) {
    return AnimeVoiceActor(
      person: AnimePerson.fromJson(json['person']),
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'language': language,
    };
  }
}

// Person model (for voice actors)
class AnimePerson {
  final int malId;
  final String url;
  final AnimePersonImages images;
  final String name;

  AnimePerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory AnimePerson.fromJson(Map<String, dynamic> json) {
    return AnimePerson(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimePersonImages.fromJson(json['images']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
    };
  }
}

// Person images model
class AnimePersonImages {
  final AnimePersonImageUrls jpg;

  AnimePersonImages({
    required this.jpg,
  });

  factory AnimePersonImages.fromJson(Map<String, dynamic> json) {
    return AnimePersonImages(
      jpg: AnimePersonImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

// Person image URLs model
class AnimePersonImageUrls {
  final String imageUrl;

  AnimePersonImageUrls({
    required this.imageUrl,
  });

  factory AnimePersonImageUrls.fromJson(Map<String, dynamic> json) {
    return AnimePersonImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
