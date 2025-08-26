import 'watch_recent_episodes.dart';
import 'watch_recent_promos.dart';

class WatchPopularPromosResponse {
  final WatchPagination pagination;
  final List<WatchPromoData> data;

  WatchPopularPromosResponse({
    required this.pagination,
    required this.data,
  });

  factory WatchPopularPromosResponse.fromJson(Map<String, dynamic> json) {
    return WatchPopularPromosResponse(
      pagination: WatchPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => WatchPromoData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
