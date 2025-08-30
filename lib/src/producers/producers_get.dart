import 'producer_data.dart';

// Pagination items model
class PaginationItems {
  final int count;
  final int total;
  final int perPage;

  PaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory PaginationItems.fromJson(Map<String, dynamic> json) {
    return PaginationItems(
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

// Pagination model
class ProducerPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final PaginationItems items;

  ProducerPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory ProducerPagination.fromJson(Map<String, dynamic> json) {
    return ProducerPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: PaginationItems.fromJson(json['items']),
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

// Producers list response model
class ProducersResponse {
  final ProducerPagination pagination;
  final List<ProducerData> data;

  ProducersResponse({
    required this.pagination,
    required this.data,
  });

  factory ProducersResponse.fromJson(Map<String, dynamic> json) {
    return ProducersResponse(
      pagination: ProducerPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => ProducerData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
