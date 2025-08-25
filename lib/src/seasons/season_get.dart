import '../anime/anime_data.dart';

class SeasonGetResponse {
  final SeasonGetPagination pagination;
  final List<AnimeData> data;

  SeasonGetResponse({
    required this.pagination,
    required this.data,
  });

  factory SeasonGetResponse.fromJson(Map<String, dynamic> json) {
    return SeasonGetResponse(
      pagination: SeasonGetPagination.fromJson(json['pagination']),
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

class SeasonGetPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final SeasonGetPaginationItems items;

  SeasonGetPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory SeasonGetPagination.fromJson(Map<String, dynamic> json) {
    return SeasonGetPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: SeasonGetPaginationItems.fromJson(json['items']),
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

class SeasonGetPaginationItems {
  final int count;
  final int total;
  final int perPage;

  SeasonGetPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory SeasonGetPaginationItems.fromJson(Map<String, dynamic> json) {
    return SeasonGetPaginationItems(
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
