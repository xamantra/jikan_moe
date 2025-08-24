class AnimeForum {
  final List<AnimeForumTopic> data;

  const AnimeForum({
    required this.data,
  });

  factory AnimeForum.fromJson(Map<String, dynamic> json) {
    return AnimeForum(
      data: (json['data'] as List<dynamic>)
          .map((topic) => AnimeForumTopic.fromJson(topic as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((topic) => topic.toJson()).toList(),
    };
  }
}

class AnimeForumTopic {
  final int malId;
  final String url;
  final String title;
  final String date;
  final String authorUsername;
  final String authorUrl;
  final int comments;
  final AnimeForumLastComment lastComment;

  const AnimeForumTopic({
    required this.malId,
    required this.url,
    required this.title,
    required this.date,
    required this.authorUsername,
    required this.authorUrl,
    required this.comments,
    required this.lastComment,
  });

  factory AnimeForumTopic.fromJson(Map<String, dynamic> json) {
    return AnimeForumTopic(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      comments: json['comments'] as int,
      lastComment: AnimeForumLastComment.fromJson(json['last_comment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'title': title,
      'date': date,
      'author_username': authorUsername,
      'author_url': authorUrl,
      'comments': comments,
      'last_comment': lastComment.toJson(),
    };
  }
}

class AnimeForumLastComment {
  final String url;
  final String authorUsername;
  final String authorUrl;
  final String date;

  const AnimeForumLastComment({
    required this.url,
    required this.authorUsername,
    required this.authorUrl,
    required this.date,
  });

  factory AnimeForumLastComment.fromJson(Map<String, dynamic> json) {
    return AnimeForumLastComment(
      url: json['url'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'author_username': authorUsername,
      'author_url': authorUrl,
      'date': date,
    };
  }
}
