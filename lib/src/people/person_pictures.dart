class PersonPicturesData {
  final PersonPicturesJpg jpg;

  PersonPicturesData({
    required this.jpg,
  });

  factory PersonPicturesData.fromJson(Map<String, dynamic> json) {
    return PersonPicturesData(
      jpg: PersonPicturesJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
    };
  }
}

class PersonPicturesJpg {
  final String imageUrl;

  PersonPicturesJpg({
    required this.imageUrl,
  });

  factory PersonPicturesJpg.fromJson(Map<String, dynamic> json) {
    return PersonPicturesJpg(
      imageUrl: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }
}

class PersonPicturesResponse {
  final List<PersonPicturesData> data;

  PersonPicturesResponse({
    required this.data,
  });

  factory PersonPicturesResponse.fromJson(Map<String, dynamic> json) {
    return PersonPicturesResponse(
      data: (json['data'] as List<dynamic>)
          .map((item) => PersonPicturesData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
