import 'index.dart';

class MangaRelationsResponse {
  final List<MangaRelation> data;

  MangaRelationsResponse({required this.data});

  factory MangaRelationsResponse.fromJson(Map<String, dynamic> json) {
    return MangaRelationsResponse(
      data: (json['data'] as List<dynamic>).map((item) => MangaRelation.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}
