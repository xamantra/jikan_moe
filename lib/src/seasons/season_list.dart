import '../anime/index.dart';

class SeasonListResponse {
  final Pagination pagination;
  final List<SeasonYearData> data;

  const SeasonListResponse({
    required this.pagination,
    required this.data,
  });

  factory SeasonListResponse.fromJson(Map<String, dynamic> json) {
    return SeasonListResponse(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => SeasonYearData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SeasonYearData {
  final int year;
  final List<String> seasons;

  const SeasonYearData({
    required this.year,
    required this.seasons,
  });

  factory SeasonYearData.fromJson(Map<String, dynamic> json) {
    return SeasonYearData(
      year: json['year'],
      seasons: (json['seasons'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'seasons': seasons,
    };
  }
}
