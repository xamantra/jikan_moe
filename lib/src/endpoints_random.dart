import 'dart:convert';
import 'jikan_client.dart';
import 'random/random_anime.dart';
import 'random/random_manga.dart';
import 'random/random_characters.dart';
import 'random/random_people.dart';
import 'random/random_users.dart';
import 'anime/anime_data.dart';
import 'manga/manga_data.dart';
import 'characters/character_data.dart';
import 'people/person_data.dart';

Future<AnimeData> getRandomAnime(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/anime'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomAnimeData = RandomAnimeData.fromJson(json);
    return randomAnimeData.data;
  } else {
    throw Exception('Failed to load random anime: ${response.statusCode}');
  }
}

Future<MangaData> getRandomManga(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/manga'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomMangaData = RandomMangaData.fromJson(json);
    return randomMangaData.data;
  } else {
    throw Exception('Failed to load random manga: ${response.statusCode}');
  }
}

Future<CharacterData> getRandomCharacters(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/characters'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomCharactersData = RandomCharactersData.fromJson(json);
    return randomCharactersData.data;
  } else {
    throw Exception('Failed to load random characters: ${response.statusCode}');
  }
}

Future<PersonData> getRandomPeople(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/people'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomPeopleData = RandomPeopleData.fromJson(json);
    return randomPeopleData.data;
  } else {
    throw Exception('Failed to load random people: ${response.statusCode}');
  }
}

Future<RandomUserData> getRandomUsers(JikanClient client) async {
  final response = await client.httpClient.get(
    Uri.parse('${client.jikanV4BaseUrl}/random/users'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final randomUsersData = RandomUsersData.fromJson(json);
    return randomUsersData.data;
  } else {
    throw Exception('Failed to load random users: ${response.statusCode}');
  }
}
