import 'index.dart';

class AnimeNews {
  final Pagination pagination;
  final List<NewsItem> data;

  const AnimeNews({
    required this.pagination,
    required this.data,
  });

  factory AnimeNews.fromJson(Map<String, dynamic> json) {
    return AnimeNews(
      pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => NewsItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class NewsItem {
  final int malId;
  final String url;
  final String title;
  final String date;
  final String authorUsername;
  final String authorUrl;
  final String forumUrl;
  final NewsImages images;
  final int comments;
  final String excerpt;

  const NewsItem({
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

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      forumUrl: json['forum_url'] as String,
      images: NewsImages.fromJson(json['images'] as Map<String, dynamic>),
      comments: json['comments'] as int,
      excerpt: json['excerpt'] as String,
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
      'forum_url': forumUrl,
      'images': images.toJson(),
      'comments': comments,
      'excerpt': excerpt,
    };
  }
}

class NewsImages {
  final NewsImageJpg jpg;

  const NewsImages({
    required this.jpg,
  });

  factory NewsImages.fromJson(Map<String, dynamic> json) {
    return NewsImages(
      jpg: NewsImageJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class NewsImageJpg {
  final String? imageUrl;

  const NewsImageJpg({
    this.imageUrl,
  });

  factory NewsImageJpg.fromJson(Map<String, dynamic> json) {
    return NewsImageJpg(
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
