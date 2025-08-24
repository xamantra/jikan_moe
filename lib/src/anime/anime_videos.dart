class AnimeVideos {
  final AnimeVideosData data;

  const AnimeVideos({
    required this.data,
  });

  factory AnimeVideos.fromJson(Map<String, dynamic> json) {
    return AnimeVideos(
      data: AnimeVideosData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AnimeVideosData {
  final List<PromoVideo> promo;
  final List<EpisodeVideo> episodes;
  final List<MusicVideo> musicVideos;

  const AnimeVideosData({
    required this.promo,
    required this.episodes,
    required this.musicVideos,
  });

  factory AnimeVideosData.fromJson(Map<String, dynamic> json) {
    return AnimeVideosData(
      promo: (json['promo'] as List<dynamic>).map((e) => PromoVideo.fromJson(e as Map<String, dynamic>)).toList(),
      episodes: (json['episodes'] as List<dynamic>).map((e) => EpisodeVideo.fromJson(e as Map<String, dynamic>)).toList(),
      musicVideos: (json['music_videos'] as List<dynamic>).map((e) => MusicVideo.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'promo': promo.map((e) => e.toJson()).toList(),
      'episodes': episodes.map((e) => e.toJson()).toList(),
      'music_videos': musicVideos.map((e) => e.toJson()).toList(),
    };
  }
}

class PromoVideo {
  final String title;
  final Trailer trailer;

  const PromoVideo({
    required this.title,
    required this.trailer,
  });

  factory PromoVideo.fromJson(Map<String, dynamic> json) {
    return PromoVideo(
      title: json['title'] as String,
      trailer: Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'trailer': trailer.toJson(),
    };
  }
}

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final TrailerImages images;

  const Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      youtubeId: json['youtube_id'] as String,
      url: json['url'] as String,
      embedUrl: json['embed_url'] as String,
      images: TrailerImages.fromJson(json['images'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class TrailerImages {
  final String imageUrl;
  final String smallImageUrl;
  final String mediumImageUrl;
  final String largeImageUrl;
  final String maximumImageUrl;

  const TrailerImages({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.maximumImageUrl,
  });

  factory TrailerImages.fromJson(Map<String, dynamic> json) {
    return TrailerImages(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      mediumImageUrl: json['medium_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
      maximumImageUrl: json['maximum_image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

class EpisodeVideo {
  final int malId;
  final String title;
  final String episode;
  final String url;
  final EpisodeImages images;

  const EpisodeVideo({
    required this.malId,
    required this.title,
    required this.episode,
    required this.url,
    required this.images,
  });

  factory EpisodeVideo.fromJson(Map<String, dynamic> json) {
    return EpisodeVideo(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      episode: json['episode'] as String,
      url: json['url'] as String,
      images: EpisodeImages.fromJson(json['images'] as Map<String, dynamic>),
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

class EpisodeImages {
  final EpisodeImageJpg jpg;

  const EpisodeImages({
    required this.jpg,
  });

  factory EpisodeImages.fromJson(Map<String, dynamic> json) {
    return EpisodeImages(
      jpg: EpisodeImageJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class EpisodeImageJpg {
  final String? imageUrl;

  const EpisodeImageJpg({
    this.imageUrl,
  });

  factory EpisodeImageJpg.fromJson(Map<String, dynamic> json) {
    return EpisodeImageJpg(
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

class MusicVideo {
  final String title;
  final MusicVideoData video;
  final MusicVideoMeta meta;

  const MusicVideo({
    required this.title,
    required this.video,
    required this.meta,
  });

  factory MusicVideo.fromJson(Map<String, dynamic> json) {
    return MusicVideo(
      title: json['title'] as String,
      video: MusicVideoData.fromJson(json['video'] as Map<String, dynamic>),
      meta: MusicVideoMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'video': video.toJson(),
      'meta': meta.toJson(),
    };
  }
}

class MusicVideoData {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final TrailerImages images;

  const MusicVideoData({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory MusicVideoData.fromJson(Map<String, dynamic> json) {
    return MusicVideoData(
      youtubeId: json['youtube_id'] as String,
      url: json['url'] as String,
      embedUrl: json['embed_url'] as String,
      images: TrailerImages.fromJson(json['images'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class MusicVideoMeta {
  final String? title;
  final String? author;

  const MusicVideoMeta({
    this.title,
    this.author,
  });

  factory MusicVideoMeta.fromJson(Map<String, dynamic> json) {
    return MusicVideoMeta(
      title: json['title'] as String?,
      author: json['author'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
    };
  }
}
