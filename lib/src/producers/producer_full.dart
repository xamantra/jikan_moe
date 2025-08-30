// Producer full data model
class ProducerFullData {
  final int malId;
  final String url;
  final List<ProducerTitle> titles;
  final ProducerImages images;
  final int favorites;
  final DateTime? established;
  final String? about;
  final int count;
  final List<ProducerExternal> external;

  ProducerFullData({
    required this.malId,
    required this.url,
    required this.titles,
    required this.images,
    required this.favorites,
    this.established,
    this.about,
    required this.count,
    required this.external,
  });

  factory ProducerFullData.fromJson(Map<String, dynamic> json) {
    return ProducerFullData(
      malId: json['mal_id'],
      url: json['url'],
      titles: (json['titles'] as List).map((title) => ProducerTitle.fromJson(title)).toList(),
      images: ProducerImages.fromJson(json['images']),
      favorites: json['favorites'],
      established: json['established'] != null ? DateTime.parse(json['established']) : null,
      about: json['about'],
      count: json['count'],
      external: (json['external'] as List).map((external) => ProducerExternal.fromJson(external)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'titles': titles.map((title) => title.toJson()).toList(),
      'images': images.toJson(),
      'favorites': favorites,
      'established': established?.toIso8601String(),
      'about': about,
      'count': count,
      'external': external.map((external) => external.toJson()).toList(),
    };
  }
}

// Producer title model
class ProducerTitle {
  final String type;
  final String title;

  ProducerTitle({
    required this.type,
    required this.title,
  });

  factory ProducerTitle.fromJson(Map<String, dynamic> json) {
    return ProducerTitle(
      type: json['type'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}

// Producer images model
class ProducerImages {
  final ProducerImageUrls jpg;

  ProducerImages({
    required this.jpg,
  });

  factory ProducerImages.fromJson(Map<String, dynamic> json) {
    return ProducerImages(
      jpg: ProducerImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

// Producer image URLs model
class ProducerImageUrls {
  final String imageUrl;

  ProducerImageUrls({
    required this.imageUrl,
  });

  factory ProducerImageUrls.fromJson(Map<String, dynamic> json) {
    return ProducerImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

// Producer external model
class ProducerExternal {
  final String name;
  final String url;

  ProducerExternal({
    required this.name,
    required this.url,
  });

  factory ProducerExternal.fromJson(Map<String, dynamic> json) {
    return ProducerExternal(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
