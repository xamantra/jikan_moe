class MangaMoreInfoResponse {
  final MangaMoreInfoData data;

  MangaMoreInfoResponse({required this.data});

  factory MangaMoreInfoResponse.fromJson(Map<String, dynamic> json) {
    return MangaMoreInfoResponse(
      data: MangaMoreInfoData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class MangaMoreInfoData {
  final String? moreinfo;

  MangaMoreInfoData({this.moreinfo});

  factory MangaMoreInfoData.fromJson(Map<String, dynamic> json) {
    return MangaMoreInfoData(
      moreinfo: json['moreinfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moreinfo': moreinfo,
    };
  }
}
