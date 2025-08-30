import 'character_data.dart';

// Character search response model
class CharacterSearchResponse {
  final CharacterPagination pagination;
  final List<CharacterData> data;

  CharacterSearchResponse({
    required this.pagination,
    required this.data,
  });

  factory CharacterSearchResponse.fromJson(Map<String, dynamic> json) {
    return CharacterSearchResponse(
      pagination: CharacterPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((character) => CharacterData.fromJson(character)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((character) => character.toJson()).toList(),
    };
  }
}

// Character pagination model
class CharacterPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final CharacterPaginationItems items;

  CharacterPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory CharacterPagination.fromJson(Map<String, dynamic> json) {
    return CharacterPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: CharacterPaginationItems.fromJson(json['items']),
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

// Character pagination items model
class CharacterPaginationItems {
  final int count;
  final int total;
  final int perPage;

  CharacterPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory CharacterPaginationItems.fromJson(Map<String, dynamic> json) {
    return CharacterPaginationItems(
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
