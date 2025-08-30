class CharacterVoicesResponse {
  final List<CharacterVoiceData> data;

  CharacterVoicesResponse({required this.data});

  factory CharacterVoicesResponse.fromJson(Map<String, dynamic> json) {
    return CharacterVoicesResponse(
      data: (json['data'] as List<dynamic>)
          .map((item) => CharacterVoiceData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CharacterVoiceData {
  final String language;
  final CharacterVoicePerson person;

  CharacterVoiceData({required this.language, required this.person});

  factory CharacterVoiceData.fromJson(Map<String, dynamic> json) {
    return CharacterVoiceData(
      language: json['language'] as String,
      person: CharacterVoicePerson.fromJson(json['person'] as Map<String, dynamic>),
    );
  }
}

class CharacterVoicePerson {
  final int malId;
  final String url;
  final CharacterVoiceImages images;
  final String name;

  CharacterVoicePerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory CharacterVoicePerson.fromJson(Map<String, dynamic> json) {
    return CharacterVoicePerson(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: CharacterVoiceImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }
}

class CharacterVoiceImages {
  final CharacterVoiceJpg jpg;

  CharacterVoiceImages({required this.jpg});

  factory CharacterVoiceImages.fromJson(Map<String, dynamic> json) {
    return CharacterVoiceImages(
      jpg: CharacterVoiceJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }
}

class CharacterVoiceJpg {
  final String imageUrl;

  CharacterVoiceJpg({required this.imageUrl});

  factory CharacterVoiceJpg.fromJson(Map<String, dynamic> json) {
    return CharacterVoiceJpg(
      imageUrl: json['image_url'] as String,
    );
  }
}
