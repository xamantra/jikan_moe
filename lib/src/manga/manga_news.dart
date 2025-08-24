class MangaNews {
  final Pagination pagination;
  final List<MangaNewsItem> data;

  const MangaNews({
    required this.pagination,
    required this.data,
  });

  factory MangaNews.fromJson(Map<String, dynamic> json) {
    return MangaNews(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => MangaNewsItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class MangaNewsItem {
  final int malId;
  final String url;
  final String title;
  final DateTime date;
  final String authorUsername;
  final String authorUrl;
  final String forumUrl;
  final MangaNewsImages images;
  final int comments;
  final String excerpt;

  const MangaNewsItem({
    required this.malId,
    required this.url,
    required this.title,
    required this.date,
    required this.authorUsername,
    required this.authorUrl,
    required this.forumUrl,
    required this.images,
    required this.comments,
    required this.excerpt,
  });

  factory MangaNewsItem.fromJson(Map<String, dynamic> json) {
    return MangaNewsItem(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      forumUrl: json['forum_url'] as String,
      images: MangaNewsImages.fromJson(json['images'] as Map<String, dynamic>),
      comments: json['comments'] as int,
      excerpt: json['excerpt'] as String,
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
      'forum_url': forumUrl,
      'images': images.toJson(),
      'comments': comments,
      'excerpt': excerpt,
    };
  }
}

class MangaNewsImages {
  final MangaNewsImageJpg jpg;

  const MangaNewsImages({
    required this.jpg,
  });

  factory MangaNewsImages.fromJson(Map<String, dynamic> json) {
    return MangaNewsImages(
      jpg: MangaNewsImageJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class MangaNewsImageJpg {
  final String? imageUrl;

  const MangaNewsImageJpg({
    this.imageUrl,
  });

  factory MangaNewsImageJpg.fromJson(Map<String, dynamic> json) {
    return MangaNewsImageJpg(
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  const Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      lastVisiblePage: json['last_visible_page'] as int,
      hasNextPage: json['has_next_page'] as bool,
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
    return 'Pagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage)';
  }
}
