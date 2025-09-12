class ClubsRelationsResponse {
  final ClubsRelationsData data;

  ClubsRelationsResponse({
    required this.data,
  });

  factory ClubsRelationsResponse.fromJson(Map<String, dynamic> json) {
    return ClubsRelationsResponse(
      data: ClubsRelationsData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ClubsRelationsData {
  final List<ClubsRelationItem> anime;
  final List<ClubsRelationItem> manga;
  final List<ClubsRelationItem> characters;

  ClubsRelationsData({
    required this.anime,
    required this.manga,
    required this.characters,
  });

  factory ClubsRelationsData.fromJson(Map<String, dynamic> json) {
    return ClubsRelationsData(
      anime: (json['anime'] as List).map((item) => ClubsRelationItem.fromJson(item)).toList(),
      manga: (json['manga'] as List).map((item) => ClubsRelationItem.fromJson(item)).toList(),
      characters: (json['characters'] as List).map((item) => ClubsRelationItem.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'anime': anime.map((item) => item.toJson()).toList(),
      'manga': manga.map((item) => item.toJson()).toList(),
      'characters': characters.map((item) => item.toJson()).toList(),
    };
  }
}

class ClubsRelationItem {
  final int malId;
  final String type;
  final String name;
  final String url;

  ClubsRelationItem({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory ClubsRelationItem.fromJson(Map<String, dynamic> json) {
    return ClubsRelationItem(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}
