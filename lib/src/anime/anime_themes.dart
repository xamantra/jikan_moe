class AnimeThemes {
  final AnimeThemesData data;

  const AnimeThemes({
    required this.data,
  });

  factory AnimeThemes.fromJson(Map<String, dynamic> json) {
    return AnimeThemes(
      data: AnimeThemesData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AnimeThemesData {
  final List<String> openings;
  final List<String> endings;

  const AnimeThemesData({
    required this.openings,
    required this.endings,
  });

  factory AnimeThemesData.fromJson(Map<String, dynamic> json) {
    return AnimeThemesData(
      openings: (json['openings'] as List<dynamic>).map((e) => e as String).toList(),
      endings: (json['endings'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'openings': openings,
      'endings': endings,
    };
  }

  String toLength() {
    return '${openings.length} openings and ${endings.length} endings';
  }
}
