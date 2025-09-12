class ClubsStaffResponse {
  final List<ClubsStaff> data;

  ClubsStaffResponse({
    required this.data,
  });

  factory ClubsStaffResponse.fromJson(Map<String, dynamic> json) {
    return ClubsStaffResponse(
      data: (json['data'] as List).map((item) => ClubsStaff.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class ClubsStaff {
  final String url;
  final String username;

  ClubsStaff({
    required this.url,
    required this.username,
  });

  factory ClubsStaff.fromJson(Map<String, dynamic> json) {
    return ClubsStaff(
      url: json['url'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'username': username,
    };
  }
}
