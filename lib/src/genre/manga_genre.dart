import 'dart:convert';

class MangaGenreData {
  final int malId;
  final String name;
  final String url;
  final int count;

  const MangaGenreData({
    required this.malId,
    required this.name,
    required this.url,
    required this.count,
  });

  factory MangaGenreData.fromJson(Map<String, dynamic> json) {
    return MangaGenreData(
      malId: json['mal_id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'name': name,
      'url': url,
      'count': count,
    };
  }

  @override
  String toString() {
    return 'MangaGenreData(malId: $malId, name: $name, url: $url, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MangaGenreData &&
        other.malId == malId &&
        other.name == name &&
        other.url == url &&
        other.count == count;
  }

  @override
  int get hashCode {
    return malId.hashCode ^ name.hashCode ^ url.hashCode ^ count.hashCode;
  }
}

class MangaGenresResponse {
  final List<MangaGenreData> data;

  const MangaGenresResponse({
    required this.data,
  });

  factory MangaGenresResponse.fromJson(Map<String, dynamic> json) {
    return MangaGenresResponse(
      data: (json['data'] as List<dynamic>)
          .map((item) => MangaGenreData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  factory MangaGenresResponse.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return MangaGenresResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'MangaGenresResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MangaGenresResponse && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
