import 'index.dart';

class AnimeVideosEpisodes {
  final Pagination pagination;
  final List<AnimeVideoEpisode> data;

  const AnimeVideosEpisodes({
    required this.pagination,
    required this.data,
  });

  factory AnimeVideosEpisodes.fromJson(Map<String, dynamic> json) {
    return AnimeVideosEpisodes(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => AnimeVideoEpisode.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class AnimeVideoEpisode {
  final int malId;
  final String title;
  final String episode;
  final String url;
  final EpisodeImages images;

  const AnimeVideoEpisode({
    required this.malId,
    required this.title,
    required this.episode,
    required this.url,
    required this.images,
  });

  factory AnimeVideoEpisode.fromJson(Map<String, dynamic> json) {
    return AnimeVideoEpisode(
      malId: json['mal_id'],
      title: json['title'],
      episode: json['episode'],
      url: json['url'],
      images: EpisodeImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'title': title,
      'episode': episode,
      'url': url,
      'images': images.toJson(),
    };
  }
}
