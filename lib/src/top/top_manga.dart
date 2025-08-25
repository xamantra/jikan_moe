import '../manga/manga_data.dart';

// Top manga response model
class TopMangaResponse {
  final TopMangaPagination pagination;
  final List<MangaData> data;

  const TopMangaResponse({
    required this.pagination,
    required this.data,
  });

  factory TopMangaResponse.fromJson(Map<String, dynamic> json) {
    return TopMangaResponse(
      pagination: TopMangaPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List).map((item) => MangaData.fromJson(item as Map<String, dynamic>)).toList(),
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
    return 'TopMangaResponse(pagination: $pagination, data: ${data.length} items)';
  }
}

// Top manga pagination model
class TopMangaPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final TopMangaPaginationItems items;

  const TopMangaPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory TopMangaPagination.fromJson(Map<String, dynamic> json) {
    return TopMangaPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: TopMangaPaginationItems.fromJson(json['items'] as Map<String, dynamic>),
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
    return 'TopMangaPagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage, currentPage: $currentPage, items: $items)';
  }
}

// Top manga pagination items model
class TopMangaPaginationItems {
  final int count;
  final int total;
  final int perPage;

  const TopMangaPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory TopMangaPaginationItems.fromJson(Map<String, dynamic> json) {
    return TopMangaPaginationItems(
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
    return 'TopMangaPaginationItems(count: $count, total: $total, perPage: $perPage)';
  }
}
