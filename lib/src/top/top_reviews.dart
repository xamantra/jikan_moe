import '../anime/index.dart';

// Top reviews response model
class TopReviewsResponse {
  final TopReviewsPagination pagination;
  final List<TopReviewData> data;

  const TopReviewsResponse({
    required this.pagination,
    required this.data,
  });

  factory TopReviewsResponse.fromJson(Map<String, dynamic> json) {
    return TopReviewsResponse(
      pagination: TopReviewsPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => TopReviewData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'TopReviewsResponse(pagination: $pagination, data: ${data.length} items)';
  }
}

// Top reviews pagination model
class TopReviewsPagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  const TopReviewsPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory TopReviewsPagination.fromJson(Map<String, dynamic> json) {
    return TopReviewsPagination(
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
    return 'TopReviewsPagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage)';
  }
}

// Unified review data model that handles both anime and manga reviews
class TopReviewData {
  final int malId;
  final String url;
  final String type;
  final Reactions reactions;
  final DateTime date;
  final String review;
  final int score;
  final List<String> tags;
  final bool isSpoiler;
  final bool isPreliminary;
  final int? episodesWatched; // For anime reviews
  final int? chaptersRead; // For manga reviews
  final TopReviewEntry entry;
  final User user;

  const TopReviewData({
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
    this.chaptersRead,
    required this.entry,
    required this.user,
  });

  factory TopReviewData.fromJson(Map<String, dynamic> json) {
    return TopReviewData(
      malId: json['mal_id'],
      url: json['url'],
      type: json['type'],
      reactions: Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
      date: DateTime.parse(json['date']),
      review: json['review'],
      score: json['score'],
      tags: (json['tags'] as List).cast<String>(),
      isSpoiler: json['is_spoiler'],
      isPreliminary: json['is_preliminary'],
      episodesWatched: json['episodes_watched'],
      chaptersRead: json['chapters_read'],
      entry: TopReviewEntry.fromJson(json['entry'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
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
      'chapters_read': chaptersRead,
      'entry': entry.toJson(),
      'user': user.toJson(),
    };
  }

  @override
  String toString() {
    return 'TopReviewData(malId: $malId, type: $type, score: $score, title: ${entry.title})';
  }
}

// Unified entry model for reviews (can be anime or manga)
class TopReviewEntry {
  final int malId;
  final String url;
  final TopReviewImages images;
  final String title;

  const TopReviewEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory TopReviewEntry.fromJson(Map<String, dynamic> json) {
    return TopReviewEntry(
      malId: json['mal_id'],
      url: json['url'],
      images: TopReviewImages.fromJson(json['images'] as Map<String, dynamic>),
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

  @override
  String toString() {
    return 'TopReviewEntry(malId: $malId, title: $title)';
  }
}

// Unified images model for review entries
class TopReviewImages {
  final TopReviewImageSet jpg;
  final TopReviewImageSet webp;

  const TopReviewImages({
    required this.jpg,
    required this.webp,
  });

  factory TopReviewImages.fromJson(Map<String, dynamic> json) {
    return TopReviewImages(
      jpg: TopReviewImageSet.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: TopReviewImageSet.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }

  @override
  String toString() {
    return 'TopReviewImages(jpg: $jpg, webp: $webp)';
  }
}

// Unified image set model for review entries
class TopReviewImageSet {
  final String imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const TopReviewImageSet({
    required this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory TopReviewImageSet.fromJson(Map<String, dynamic> json) {
    return TopReviewImageSet(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }

  @override
  String toString() {
    return 'TopReviewImageSet(imageUrl: $imageUrl)';
  }
}
