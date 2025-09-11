import '../anime/anime_episodes.dart';

class UsersReviewsResponse {
  final Pagination pagination;
  final List<UsersReviewData> data;

  UsersReviewsResponse({
    required this.pagination,
    required this.data,
  });

  factory UsersReviewsResponse.fromJson(Map<String, dynamic> json) {
    return UsersReviewsResponse(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((item) => UsersReviewData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersReviewData {
  final int malId;
  final String url;
  final String type;
  final UsersReviewReactions reactions;
  final DateTime date;
  final String review;
  final int score;
  final List<String> tags;
  final bool isSpoiler;
  final bool isPreliminary;
  final int? episodesWatched;
  final UsersReviewEntry entry;

  UsersReviewData({
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
  });

  factory UsersReviewData.fromJson(Map<String, dynamic> json) {
    return UsersReviewData(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      type: json['type'] as String,
      reactions: UsersReviewReactions.fromJson(json['reactions'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      review: json['review'] as String,
      score: json['score'] as int,
      tags: (json['tags'] as List<dynamic>).map((item) => item as String).toList(),
      isSpoiler: json['is_spoiler'] as bool,
      isPreliminary: json['is_preliminary'] as bool,
      episodesWatched: json['episodes_watched'] as int?,
      entry: UsersReviewEntry.fromJson(json['entry'] as Map<String, dynamic>),
    );
  }
}

class UsersReviewReactions {
  final int overall;
  final int nice;
  final int loveIt;
  final int funny;
  final int confusing;
  final int informative;
  final int wellWritten;
  final int creative;

  UsersReviewReactions({
    required this.overall,
    required this.nice,
    required this.loveIt,
    required this.funny,
    required this.confusing,
    required this.informative,
    required this.wellWritten,
    required this.creative,
  });

  factory UsersReviewReactions.fromJson(Map<String, dynamic> json) {
    return UsersReviewReactions(
      overall: json['overall'] as int,
      nice: json['nice'] as int,
      loveIt: json['love_it'] as int,
      funny: json['funny'] as int,
      confusing: json['confusing'] as int,
      informative: json['informative'] as int,
      wellWritten: json['well_written'] as int,
      creative: json['creative'] as int,
    );
  }
}

class UsersReviewEntry {
  final int malId;
  final String url;
  final UsersReviewEntryImages images;
  final String title;

  UsersReviewEntry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory UsersReviewEntry.fromJson(Map<String, dynamic> json) {
    return UsersReviewEntry(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: UsersReviewEntryImages.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String,
    );
  }
}

class UsersReviewEntryImages {
  final UsersReviewEntryImageFormat jpg;
  final UsersReviewEntryImageFormat webp;

  UsersReviewEntryImages({
    required this.jpg,
    required this.webp,
  });

  factory UsersReviewEntryImages.fromJson(Map<String, dynamic> json) {
    return UsersReviewEntryImages(
      jpg: UsersReviewEntryImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: UsersReviewEntryImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class UsersReviewEntryImageFormat {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  UsersReviewEntryImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory UsersReviewEntryImageFormat.fromJson(Map<String, dynamic> json) {
    return UsersReviewEntryImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}
