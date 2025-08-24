class AnimeMoreInfo {
  final AnimeMoreInfoData data;

  const AnimeMoreInfo({
    required this.data,
  });

  factory AnimeMoreInfo.fromJson(Map<String, dynamic> json) {
    return AnimeMoreInfo(
      data: AnimeMoreInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AnimeMoreInfoData {
  final String? moreinfo;

  const AnimeMoreInfoData({
    this.moreinfo,
  });

  factory AnimeMoreInfoData.fromJson(Map<String, dynamic> json) {
    return AnimeMoreInfoData(
      moreinfo: json['moreinfo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moreinfo': moreinfo,
    };
  }
}
