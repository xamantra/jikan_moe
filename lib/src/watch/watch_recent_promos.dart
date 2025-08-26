import 'watch_recent_episodes.dart';

class WatchPromosResponse {
  final WatchPagination pagination;
  final List<WatchPromoData> data;

  WatchPromosResponse({
    required this.pagination,
    required this.data,
  });

  factory WatchPromosResponse.fromJson(Map<String, dynamic> json) {
    return WatchPromosResponse(
      pagination: WatchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => WatchPromoData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class WatchPromoData {
  final String title;
  final WatchAnimeEntry entry;
  final WatchTrailer trailer;

  WatchPromoData({
    required this.title,
    required this.entry,
    required this.trailer,
  });

  factory WatchPromoData.fromJson(Map<String, dynamic> json) {
    return WatchPromoData(
      title: json['title'],
      entry: WatchAnimeEntry.fromJson(json['entry']),
      trailer: WatchTrailer.fromJson(json['trailer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'entry': entry.toJson(),
      'trailer': trailer.toJson(),
    };
  }
}

class WatchTrailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final WatchTrailerImages images;

  WatchTrailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    required this.images,
  });

  factory WatchTrailer.fromJson(Map<String, dynamic> json) {
    return WatchTrailer(
      youtubeId: json['youtube_id'],
      url: json['url'],
      embedUrl: json['embed_url'],
      images: WatchTrailerImages.fromJson(json['images']),
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

class WatchTrailerImages {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  WatchTrailerImages({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory WatchTrailerImages.fromJson(Map<String, dynamic> json) {
    return WatchTrailerImages(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      mediumImageUrl: json['medium_image_url'],
      largeImageUrl: json['large_image_url'],
      maximumImageUrl: json['maximum_image_url'],
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
