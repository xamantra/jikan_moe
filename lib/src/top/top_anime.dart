import '../anime/anime_data.dart';

// Top anime response model
class TopAnimeResponse {
  final TopAnimePagination pagination;
  final List<AnimeData> data;

  const TopAnimeResponse({
    required this.pagination,
    required this.data,
  });

  factory TopAnimeResponse.fromJson(Map<String, dynamic> json) {
    return TopAnimeResponse(
      pagination: TopAnimePagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => AnimeData.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'TopAnimeResponse(pagination: $pagination, data: ${data.length} items)';
  }
}

// Top anime pagination model
class TopAnimePagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final TopAnimePaginationItems items;

  const TopAnimePagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory TopAnimePagination.fromJson(Map<String, dynamic> json) {
    return TopAnimePagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: TopAnimePaginationItems.fromJson(json['items'] as Map<String, dynamic>),
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

  @override
  String toString() {
    return 'TopAnimePagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage, currentPage: $currentPage, items: $items)';
  }
}

// Top anime pagination items model
class TopAnimePaginationItems {
  final int count;
  final int total;
  final int perPage;

  const TopAnimePaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory TopAnimePaginationItems.fromJson(Map<String, dynamic> json) {
    return TopAnimePaginationItems(
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

  @override
  String toString() {
    return 'TopAnimePaginationItems(count: $count, total: $total, perPage: $perPage)';
  }
}
