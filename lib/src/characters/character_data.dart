import 'character_full.dart';

// Basic character data model
class CharacterData {
  final int malId;
  final String url;
  final CharacterImages images;
  final String name;
  final String? nameKanji;
  final List<String> nicknames;
  final int favorites;
  final String? about;

  CharacterData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    this.nameKanji,
    required this.nicknames,
    required this.favorites,
    this.about,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterImages.fromJson(json['images']),
      name: json['name'],
      nameKanji: json['name_kanji'],
      nicknames: List<String>.from(json['nicknames']),
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
}

// Root response model (for consistency with other endpoints)
class CharacterDataResponse {
  final CharacterData data;

  CharacterDataResponse({required this.data});

  factory CharacterDataResponse.fromJson(Map<String, dynamic> json) {
    return CharacterDataResponse(
      data: CharacterData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
