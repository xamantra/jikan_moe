class AnimeEpisode {
  final int malId;
  final String? url;
  final String title;
  final String? titleJapanese;
  final String? titleRomanji;
  final int? duration;
  final DateTime aired;
  final bool filler;
  final bool recap;
  final String? synopsis;

  const AnimeEpisode({
    required this.malId,
    required this.url,
    required this.title,
    required this.titleJapanese,
    required this.titleRomanji,
    required this.duration,
    required this.aired,
    required this.filler,
    required this.recap,
    this.synopsis,
  });

  factory AnimeEpisode.fromJson(Map<String, dynamic> json) {
    return AnimeEpisode(
      malId: json['mal_id'],
      url: json['url'] as String?,
      title: json['title'] as String,
      titleJapanese: json['title_japanese'] as String?,
      titleRomanji: json['title_romanji'] as String?,
      duration: json['duration'],
      aired: DateTime.parse(json['aired'] as String),
      filler: json['filler'] ?? false,
      recap: json['recap'] ?? false,
      synopsis: json['synopsis'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'title': title,
      'title_japanese': titleJapanese,
      'title_romanji': titleRomanji,
      'duration': duration,
      'aired': aired.toIso8601String(),
      'filler': filler,
      'recap': recap,
      'synopsis': synopsis,
    };
  }
}
