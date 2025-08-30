import '../anime/anime_full.dart';
import '../manga/manga_full.dart';
import '../characters/character_full.dart';

// Person images model
class PersonImages {
  final PersonImageJpg jpg;

  PersonImages({required this.jpg});

  factory PersonImages.fromJson(Map<String, dynamic> json) {
    return PersonImages(
      jpg: PersonImageJpg.fromJson(json['jpg']),
    );
  }
}

class PersonImageJpg {
  final String imageUrl;

  PersonImageJpg({required this.imageUrl});

  factory PersonImageJpg.fromJson(Map<String, dynamic> json) {
    return PersonImageJpg(
      imageUrl: json['image_url'],
    );
  }
}

// Anime model for person's anime works
class PersonAnime {
  final int malId;
  final String url;
  final AnimeImages images;
  final String title;

  PersonAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory PersonAnime.fromJson(Map<String, dynamic> json) {
    return PersonAnime(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeImages.fromJson(json['images']),
      title: json['title'],
    );
  }
}

// Anime position model
class PersonAnimePosition {
  final String position;
  final PersonAnime anime;

  PersonAnimePosition({
    required this.position,
    required this.anime,
  });

  factory PersonAnimePosition.fromJson(Map<String, dynamic> json) {
    return PersonAnimePosition(
      position: json['position'],
      anime: PersonAnime.fromJson(json['anime']),
    );
  }
}

// Manga model for person's manga works
class PersonManga {
  final int malId;
  final String url;
  final MangaImages images;
  final String title;

  PersonManga({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory PersonManga.fromJson(Map<String, dynamic> json) {
    return PersonManga(
      malId: json['mal_id'],
      url: json['url'],
      images: MangaImages.fromJson(json['images']),
      title: json['title'],
    );
  }
}

// Manga position model
class PersonMangaPosition {
  final String position;
  final PersonManga manga;

  PersonMangaPosition({
    required this.position,
    required this.manga,
  });

  factory PersonMangaPosition.fromJson(Map<String, dynamic> json) {
    return PersonMangaPosition(
      position: json['position'],
      manga: PersonManga.fromJson(json['manga']),
    );
  }
}

// Character model for person's voice roles
class PersonCharacter {
  final int malId;
  final String url;
  final CharacterImages images;
  final String name;

  PersonCharacter({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory PersonCharacter.fromJson(Map<String, dynamic> json) {
    return PersonCharacter(
      malId: json['mal_id'],
      url: json['url'],
      images: CharacterImages.fromJson(json['images']),
      name: json['name'],
    );
  }
}

// Voice role model
class PersonVoice {
  final String role;
  final PersonAnime anime;
  final PersonCharacter character;

  PersonVoice({
    required this.role,
    required this.anime,
    required this.character,
  });

  factory PersonVoice.fromJson(Map<String, dynamic> json) {
    return PersonVoice(
      role: json['role'],
      anime: PersonAnime.fromJson(json['anime']),
      character: PersonCharacter.fromJson(json['character']),
    );
  }
}

// Main person data model
class PersonFullData {
  final int malId;
  final String url;
  final String? websiteUrl;
  final PersonImages images;
  final String name;
  final String? givenName;
  final String? familyName;
  final List<String> alternateNames;
  final DateTime? birthday;
  final int favorites;
  final String? about;
  final List<PersonAnimePosition> anime;
  final List<PersonMangaPosition> manga;
  final List<PersonVoice> voices;

  PersonFullData({
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
    required this.anime,
    required this.manga,
    required this.voices,
  });

  factory PersonFullData.fromJson(Map<String, dynamic> json) {
    return PersonFullData(
      malId: json['mal_id'],
      url: json['url'],
      websiteUrl: json['website_url'],
      images: PersonImages.fromJson(json['images']),
      name: json['name'],
      givenName: json['given_name'],
      familyName: json['family_name'],
      alternateNames: List<String>.from(json['alternate_names']),
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      favorites: json['favorites'],
      about: json['about'],
      anime: (json['anime'] as List).map((anime) => PersonAnimePosition.fromJson(anime)).toList(),
      manga: (json['manga'] as List).map((manga) => PersonMangaPosition.fromJson(manga)).toList(),
      voices: (json['voices'] as List).map((voice) => PersonVoice.fromJson(voice)).toList(),
    );
  }
}

// Root response model
class PersonFullResponse {
  final PersonFullData data;

  PersonFullResponse({required this.data});

  factory PersonFullResponse.fromJson(Map<String, dynamic> json) {
    return PersonFullResponse(
      data: PersonFullData.fromJson(json['data']),
    );
  }
}
