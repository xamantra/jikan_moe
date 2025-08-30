import 'reviews_recent_anime.dart';

class ReviewsRecentMangaResponse {
  final ReviewsPagination pagination;
  final List<RecentMangaReviewData> data;

  const ReviewsRecentMangaResponse({
    required this.pagination,
    required this.data,
  });

  factory ReviewsRecentMangaResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsRecentMangaResponse(
      pagination: ReviewsPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((e) => RecentMangaReviewData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class RecentMangaReviewData {
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
  final int? chaptersRead;
  final Entry entry;
  final RecentReviewUser user;

  const RecentMangaReviewData({
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
    this.chaptersRead,
    required this.entry,
    required this.user,
  });

  factory RecentMangaReviewData.fromJson(Map<String, dynamic> json) {
    return RecentMangaReviewData(
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
      chaptersRead: json['chapters_read'],
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
      'chapters_read': chaptersRead,
      'entry': entry.toJson(),
      'user': user.toJson(),
    };
  }
}
