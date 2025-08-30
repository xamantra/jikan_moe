class ReviewsRecentAnimeResponse {
  final ReviewsPagination pagination;
  final List<RecentReviewData> data;

  const ReviewsRecentAnimeResponse({
    required this.pagination,
    required this.data,
  });

  factory ReviewsRecentAnimeResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsRecentAnimeResponse(
      pagination: ReviewsPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((e) => RecentReviewData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class ReviewsPagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  const ReviewsPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory ReviewsPagination.fromJson(Map<String, dynamic> json) {
    return ReviewsPagination(
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
}

class RecentReviewData {
  final int malId;
  final String url;
  final String type;
  final RecentReactions reactions;
  final DateTime date;
  final String review;
  final int score;
  final List<String> tags;
  final bool isSpoiler;
  final bool isPreliminary;
  final int? episodesWatched;
  final Entry entry;
  final RecentReviewUser user;

  const RecentReviewData({
    required this.malId,
    required this.url,
    required this.type,
    required this.reactions,
    required this.date,
    required this.review,
    required this.score,
    required this.tags,
    required this.isSpoiler,
    required this.isPreliminary,
    this.episodesWatched,
    required this.entry,
    required this.user,
  });

  factory RecentReviewData.fromJson(Map<String, dynamic> json) {
    return RecentReviewData(
      malId: json['mal_id'],
      url: json['url'],
      type: json['type'],
      reactions: RecentReactions.fromJson(json['reactions']),
      date: DateTime.parse(json['date']),
      review: json['review'],
      score: json['score'],
      tags: (json['tags'] as List).cast<String>(),
      isSpoiler: json['is_spoiler'],
      isPreliminary: json['is_preliminary'],
      episodesWatched: json['episodes_watched'],
      entry: Entry.fromJson(json['entry']),
      user: RecentReviewUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'type': type,
      'reactions': reactions.toJson(),
      'date': date.toIso8601String(),
      'review': review,
      'score': score,
      'tags': tags,
      'is_spoiler': isSpoiler,
      'is_preliminary': isPreliminary,
      'episodes_watched': episodesWatched,
      'entry': entry.toJson(),
      'user': user.toJson(),
    };
  }
}

class RecentReactions {
  final int overall;
  final int nice;
  final int loveIt;
  final int funny;
  final int confusing;
  final int informative;
  final int wellWritten;
  final int creative;

  const RecentReactions({
    required this.overall,
    required this.nice,
    required this.loveIt,
    required this.funny,
    required this.confusing,
    required this.informative,
    required this.wellWritten,
    required this.creative,
  });

  factory RecentReactions.fromJson(Map<String, dynamic> json) {
    return RecentReactions(
      overall: json['overall'],
      nice: json['nice'],
      loveIt: json['love_it'],
      funny: json['funny'],
      confusing: json['confusing'],
      informative: json['informative'],
      wellWritten: json['well_written'],
      creative: json['creative'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overall': overall,
      'nice': nice,
      'love_it': loveIt,
      'funny': funny,
      'confusing': confusing,
      'informative': informative,
      'well_written': wellWritten,
      'creative': creative,
    };
  }
}

class Entry {
  final int malId;
  final String url;
  final Images images;
  final String title;

  const Entry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      malId: json['mal_id'],
      url: json['url'],
      images: Images.fromJson(json['images']),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'title': title,
    };
  }
}

class Images {
  final ImageFormat jpg;
  final ImageFormat webp;

  const Images({
    required this.jpg,
    required this.webp,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: ImageFormat.fromJson(json['jpg']),
      webp: ImageFormat.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class ImageFormat {
  final String imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const ImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) {
    return ImageFormat(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

class RecentReviewUser {
  final String url;
  final String username;
  final RecentReviewUserImages images;

  const RecentReviewUser({
    required this.url,
    required this.username,
    required this.images,
  });

  factory RecentReviewUser.fromJson(Map<String, dynamic> json) {
    return RecentReviewUser(
      url: json['url'],
      username: json['username'],
      images: RecentReviewUserImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'username': username,
      'images': images.toJson(),
    };
  }
}

class RecentReviewUserImages {
  final ImageFormat jpg;
  final ImageFormat webp;

  const RecentReviewUserImages({
    required this.jpg,
    required this.webp,
  });

  factory RecentReviewUserImages.fromJson(Map<String, dynamic> json) {
    return RecentReviewUserImages(
      jpg: ImageFormat.fromJson(json['jpg']),
      webp: ImageFormat.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}
