class AnimeEpisodes {
  final Pagination pagination;
  final List<Episode> data;

  const AnimeEpisodes({
    required this.pagination,
    required this.data,
  });

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) {
    return AnimeEpisodes(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((episode) => Episode.fromJson(episode)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((episode) => episode.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AnimeEpisodes(pagination: $pagination, data: $data)';
  }
}

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  const Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
    };
  }

  @override
  String toString() {
    return 'Pagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage)';
  }
}

class Episode {
  final int malId;
  final String? url;
  final String title;
  final String? titleJapanese;
  final String? titleRomanji;
  final DateTime aired;
  final double score;
  final bool filler;
  final bool recap;
  final String? forumUrl;

  const Episode({
    required this.malId,
    this.url,
    required this.title,
    this.titleJapanese,
    this.titleRomanji,
    required this.aired,
    required this.score,
    required this.filler,
    required this.recap,
    this.forumUrl,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      malId: json['mal_id'],
      url: json['url'],
      title: json['title'],
      titleJapanese: json['title_japanese'],
      titleRomanji: json['title_romanji'],
      aired: DateTime.parse(json['aired']),
      score: json['score']?.toDouble() ?? 0.0,
      filler: json['filler'] ?? false,
      recap: json['recap'] ?? false,
      forumUrl: json['forum_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'title': title,
      'title_japanese': titleJapanese,
      'title_romanji': titleRomanji,
      'aired': aired.toIso8601String(),
      'score': score,
      'filler': filler,
      'recap': recap,
      'forum_url': forumUrl,
    };
  }

  @override
  String toString() {
    return 'Episode(malId: $malId, title: $title, aired: $aired, score: $score, filler: $filler, recap: $recap)';
  }
}
