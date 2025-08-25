import '../anime/anime_data.dart';

class SeasonUpcomingResponse {
  final SeasonUpcomingPagination pagination;
  final List<AnimeData> data;

  SeasonUpcomingResponse({
    required this.pagination,
    required this.data,
  });

  factory SeasonUpcomingResponse.fromJson(Map<String, dynamic> json) {
    return SeasonUpcomingResponse(
      pagination: SeasonUpcomingPagination.fromJson(json['pagination']),
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

class SeasonUpcomingPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final SeasonUpcomingPaginationItems items;

  SeasonUpcomingPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory SeasonUpcomingPagination.fromJson(Map<String, dynamic> json) {
    return SeasonUpcomingPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: SeasonUpcomingPaginationItems.fromJson(json['items']),
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

class SeasonUpcomingPaginationItems {
  final int count;
  final int total;
  final int perPage;

  SeasonUpcomingPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory SeasonUpcomingPaginationItems.fromJson(Map<String, dynamic> json) {
    return SeasonUpcomingPaginationItems(
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
