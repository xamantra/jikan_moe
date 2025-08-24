import 'index.dart';

class AnimeRelations {
  final List<AnimeRelation> data;

  const AnimeRelations({
    required this.data,
  });

  factory AnimeRelations.fromJson(Map<String, dynamic> json) {
    return AnimeRelations(
      data: (json['data'] as List<dynamic>).map((e) => AnimeRelation.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
