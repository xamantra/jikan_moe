import 'index.dart';

class AnimeUserUpdates {
  final Pagination pagination;
  final List<AnimeUserUpdate> data;

  const AnimeUserUpdates({
    required this.pagination,
    required this.data,
  });

  factory AnimeUserUpdates.fromJson(Map<String, dynamic> json) {
    return AnimeUserUpdates(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => AnimeUserUpdate.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class AnimeUserUpdate {
  final User user;
  final int? score;
  final String status;
  final int? episodesSeen;
  final int? episodesTotal;
  final DateTime date;

  const AnimeUserUpdate({
    required this.user,
    this.score,
    required this.status,
    this.episodesSeen,
    this.episodesTotal,
    required this.date,
  });

  factory AnimeUserUpdate.fromJson(Map<String, dynamic> json) {
    return AnimeUserUpdate(
      user: User.fromJson(json['user']),
      score: json['score'],
      status: json['status'],
      episodesSeen: json['episodes_seen'],
      episodesTotal: json['episodes_total'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'score': score,
      'status': status,
      'episodes_seen': episodesSeen,
      'episodes_total': episodesTotal,
      'date': date.toIso8601String(),
    };
  }
}

class User {
  final String username;
  final String url;
  final UserImages images;

  const User({
    required this.username,
    required this.url,
    required this.images,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      url: json['url'],
      images: UserImages.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'url': url,
      'images': images.toJson(),
    };
  }
}

class UserImages {
  final UserImage jpg;
  final UserImage webp;

  const UserImages({
    required this.jpg,
    required this.webp,
  });

  factory UserImages.fromJson(Map<String, dynamic> json) {
    return UserImages(
      jpg: UserImage.fromJson(json['jpg']),
      webp: UserImage.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class UserImage {
  final String imageUrl;

  const UserImage({
    required this.imageUrl,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) {
    return UserImage(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
