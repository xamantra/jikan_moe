class MangaForum {
  final List<MangaForumTopic> data;

  const MangaForum({
    required this.data,
  });

  factory MangaForum.fromJson(Map<String, dynamic> json) {
    return MangaForum(
      data: (json['data'] as List<dynamic>).map((topic) => MangaForumTopic.fromJson(topic as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((topic) => topic.toJson()).toList(),
    };
  }
}

class MangaForumTopic {
  final int malId;
  final String url;
  final String title;
  final DateTime date;
  final String authorUsername;
  final String authorUrl;
  final int comments;
  final MangaForumLastComment lastComment;

  const MangaForumTopic({
    required this.malId,
    required this.url,
    required this.title,
    required this.date,
    required this.authorUsername,
    required this.authorUrl,
    required this.comments,
    required this.lastComment,
  });

  factory MangaForumTopic.fromJson(Map<String, dynamic> json) {
    return MangaForumTopic(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      comments: json['comments'] as int,
      lastComment: MangaForumLastComment.fromJson(json['last_comment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'title': title,
      'date': date.toIso8601String(),
      'author_username': authorUsername,
      'author_url': authorUrl,
      'comments': comments,
      'last_comment': lastComment.toJson(),
    };
  }
}

class MangaForumLastComment {
  final String url;
  final String authorUsername;
  final String authorUrl;
  final DateTime date;

  const MangaForumLastComment({
    required this.url,
    required this.authorUsername,
    required this.authorUrl,
    required this.date,
  });

  factory MangaForumLastComment.fromJson(Map<String, dynamic> json) {
    return MangaForumLastComment(
      url: json['url'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'author_username': authorUsername,
      'author_url': authorUrl,
      'date': date.toIso8601String(),
    };
  }
}
