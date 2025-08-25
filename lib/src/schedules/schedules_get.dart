import '../anime/anime_data.dart';

class SchedulesResponse {
  final SchedulesPagination pagination;
  final List<AnimeData> data;

  SchedulesResponse({
    required this.pagination,
    required this.data,
  });

  factory SchedulesResponse.fromJson(Map<String, dynamic> json) {
    return SchedulesResponse(
      pagination: SchedulesPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => AnimeData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SchedulesPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final SchedulesPaginationItems items;

  SchedulesPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory SchedulesPagination.fromJson(Map<String, dynamic> json) {
    return SchedulesPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: SchedulesPaginationItems.fromJson(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
      'current_page': currentPage,
      'items': items.toJson(),
    };
  }
}

class SchedulesPaginationItems {
  final int count;
  final int total;
  final int perPage;

  SchedulesPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory SchedulesPaginationItems.fromJson(Map<String, dynamic> json) {
    return SchedulesPaginationItems(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'per_page': perPage,
    };
  }
}
