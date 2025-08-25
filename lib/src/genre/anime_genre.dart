import 'dart:convert';

class AnimeGenreData {
  final int malId;
  final String name;
  final String url;
  final int count;

  const AnimeGenreData({
    required this.malId,
    required this.name,
    required this.url,
    required this.count,
  });

  factory AnimeGenreData.fromJson(Map<String, dynamic> json) {
    return AnimeGenreData(
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
    return 'AnimeGenreData(malId: $malId, name: $name, url: $url, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnimeGenreData &&
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

class AnimeGenresResponse {
  final List<AnimeGenreData> data;

  const AnimeGenresResponse({
    required this.data,
  });

  factory AnimeGenresResponse.fromJson(Map<String, dynamic> json) {
    return AnimeGenresResponse(
      data: (json['data'] as List<dynamic>)
          .map((item) => AnimeGenreData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  factory AnimeGenresResponse.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return AnimeGenresResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AnimeGenresResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnimeGenresResponse && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
