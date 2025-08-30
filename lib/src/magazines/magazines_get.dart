class MagazinesResponse {
  final MagazinesPagination pagination;
  final List<MagazineData> data;

  MagazinesResponse({
    required this.pagination,
    required this.data,
  });

  factory MagazinesResponse.fromJson(Map<String, dynamic> json) {
    return MagazinesResponse(
      pagination: MagazinesPagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((e) => MagazineData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class MagazinesPagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final MagazinesPaginationItems items;

  MagazinesPagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory MagazinesPagination.fromJson(Map<String, dynamic> json) {
    return MagazinesPagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: MagazinesPaginationItems.fromJson(json['items']),
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

class MagazinesPaginationItems {
  final int count;
  final int total;
  final int perPage;

  MagazinesPaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory MagazinesPaginationItems.fromJson(Map<String, dynamic> json) {
    return MagazinesPaginationItems(
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

class MagazineData {
  final int malId;
  final String name;
  final String url;
  final int count;

  MagazineData({
    required this.malId,
    required this.name,
    required this.url,
    required this.count,
  });

  factory MagazineData.fromJson(Map<String, dynamic> json) {
    return MagazineData(
      malId: json['mal_id'],
      name: json['name'],
      url: json['url'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'name': name,
      'url': url,
      'count': count,
    };
  }
}
