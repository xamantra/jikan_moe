import '../characters/character_data.dart';

class RandomCharactersData {
  final CharacterData data;

  RandomCharactersData({required this.data});

  factory RandomCharactersData.fromJson(Map<String, dynamic> json) {
    return RandomCharactersData(
      data: CharacterData.fromJson(json['data']),
    );
  }
}
