import 'index.dart';

class MangaReviews {
  final Pagination pagination;
  final List<MangaReviewData> data;

  const MangaReviews({
    required this.pagination,
    required this.data,
  });

  factory MangaReviews.fromJson(Map<String, dynamic> json) {
    return MangaReviews(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((e) => MangaReviewData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class MangaReviewData {
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
  final int? chaptersRead;
  final User user;

  const MangaReviewData({
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
    required this.user,
  });

  factory MangaReviewData.fromJson(Map<String, dynamic> json) {
    return MangaReviewData(
      malId: json['mal_id'],
      url: json['url'],
      type: json['type'],
      reactions: Reactions.fromJson(json['reactions']),
      date: DateTime.parse(json['date']),
      review: json['review'],
      score: json['score'],
      tags: (json['tags'] as List).cast<String>(),
      isSpoiler: json['is_spoiler'],
      isPreliminary: json['is_preliminary'],
      chaptersRead: json['chapters_read'],
      user: User.fromJson(json['user']),
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
      'user': user.toJson(),
    };
  }
}

class Reactions {
  final int overall;
  final int nice;
  final int loveIt;
  final int funny;
  final int confusing;
  final int informative;
  final int wellWritten;
  final int creative;

  const Reactions({
    required this.overall,
    required this.nice,
    required this.loveIt,
    required this.funny,
    required this.confusing,
    required this.informative,
    required this.wellWritten,
    required this.creative,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
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
