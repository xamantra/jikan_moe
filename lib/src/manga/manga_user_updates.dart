import '../anime/index.dart';

class MangaUserUpdates {
  final Pagination pagination;
  final List<MangaUserUpdate> data;

  const MangaUserUpdates({
    required this.pagination,
    required this.data,
  });

  factory MangaUserUpdates.fromJson(Map<String, dynamic> json) {
    return MangaUserUpdates(
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List).map((item) => MangaUserUpdate.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class MangaUserUpdate {
  final User user;
  final int? score;
  final String status;
  final int? volumesRead;
  final int? volumesTotal;
  final int? chaptersRead;
  final int? chaptersTotal;
  final DateTime date;

  const MangaUserUpdate({
    required this.user,
    this.score,
    required this.status,
    this.volumesRead,
    this.volumesTotal,
    this.chaptersRead,
    this.chaptersTotal,
    required this.date,
  });

  factory MangaUserUpdate.fromJson(Map<String, dynamic> json) {
    return MangaUserUpdate(
      user: User.fromJson(json['user']),
      score: json['score'],
      status: json['status'],
      volumesRead: json['volumes_read'],
      volumesTotal: json['volumes_total'],
      chaptersRead: json['chapters_read'],
      chaptersTotal: json['chapters_total'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'score': score,
      'status': status,
      'volumes_read': volumesRead,
      'volumes_total': volumesTotal,
      'chapters_read': chaptersRead,
      'chapters_total': chaptersTotal,
      'date': date.toIso8601String(),
    };
  }
}
