import '../anime/anime_data.dart';

class SeasonNowResponse {
  final SeasonNowPagination pagination;
  final List<AnimeData> data;

  SeasonNowResponse({
    required this.pagination,
    required this.data,
  });

  factory SeasonNowResponse.fromJson(Map<String, dynamic> json) {
    return SeasonNowResponse(
      pagination: SeasonNowPagination.fromJson(json['pagination']),
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

class SeasonNowPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final SeasonNowPaginationItems items;

  SeasonNowPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory SeasonNowPagination.fromJson(Map<String, dynamic> json) {
    return SeasonNowPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: SeasonNowPaginationItems.fromJson(json['items']),
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

class SeasonNowPaginationItems {
  final int count;
  final int total;
  final int perPage;

  SeasonNowPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory SeasonNowPaginationItems.fromJson(Map<String, dynamic> json) {
    return SeasonNowPaginationItems(
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
