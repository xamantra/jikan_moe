// Main anime staff response model
class AnimeStaffResponse {
  final List<AnimeStaff> data;

  AnimeStaffResponse({required this.data});

  factory AnimeStaffResponse.fromJson(Map<String, dynamic> json) {
    return AnimeStaffResponse(
      data: (json['data'] as List).map((staff) => AnimeStaff.fromJson(staff)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((staff) => staff.toJson()).toList(),
    };
  }
}

// Individual staff member model
class AnimeStaff {
  final AnimeStaffPerson person;
  final List<String> positions;

  AnimeStaff({
    required this.person,
    required this.positions,
  });

  factory AnimeStaff.fromJson(Map<String, dynamic> json) {
    return AnimeStaff(
      person: AnimeStaffPerson.fromJson(json['person']),
      positions: (json['positions'] as List).map((position) => position.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'positions': positions,
    };
  }
}

// Staff person information model
class AnimeStaffPerson {
  final int malId;
  final String url;
  final AnimeStaffImages images;
  final String name;

  AnimeStaffPerson({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory AnimeStaffPerson.fromJson(Map<String, dynamic> json) {
    return AnimeStaffPerson(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeStaffImages.fromJson(json['images']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'name': name,
    };
  }
}

// Staff images model
class AnimeStaffImages {
  final AnimeStaffImageUrls jpg;

  AnimeStaffImages({
    required this.jpg,
  });

  factory AnimeStaffImages.fromJson(Map<String, dynamic> json) {
    return AnimeStaffImages(
      jpg: AnimeStaffImageUrls.fromJson(json['jpg']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

// Staff image URLs model
class AnimeStaffImageUrls {
  final String imageUrl;

  AnimeStaffImageUrls({
    required this.imageUrl,
  });

  factory AnimeStaffImageUrls.fromJson(Map<String, dynamic> json) {
    return AnimeStaffImageUrls(
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}
