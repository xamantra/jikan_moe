import '../people/person_data.dart';

class RandomPeopleData {
  final PersonData data;

  RandomPeopleData({required this.data});

  factory RandomPeopleData.fromJson(Map<String, dynamic> json) {
    return RandomPeopleData(
      data: PersonData.fromJson(json['data']),
    );
  }
}
