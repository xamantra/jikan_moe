class UsersStatisticsResponse {
  final UsersStatisticsData data;

  UsersStatisticsResponse({
    required this.data,
  });

  factory UsersStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return UsersStatisticsResponse(
      data: UsersStatisticsData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UsersStatisticsData {
  final UsersAnimeStatistics anime;
  final UsersMangaStatistics manga;

  UsersStatisticsData({
    required this.anime,
    required this.manga,
  });

  factory UsersStatisticsData.fromJson(Map<String, dynamic> json) {
    return UsersStatisticsData(
      anime: UsersAnimeStatistics.fromJson(json['anime'] as Map<String, dynamic>),
      manga: UsersMangaStatistics.fromJson(json['manga'] as Map<String, dynamic>),
    );
  }
}

class UsersAnimeStatistics {
  final double daysWatched;
  final double meanScore;
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;
  final int totalEntries;
  final int rewatched;
  final int episodesWatched;

  UsersAnimeStatistics({
    required this.daysWatched,
    required this.meanScore,
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
    required this.totalEntries,
    required this.rewatched,
    required this.episodesWatched,
  });

  factory UsersAnimeStatistics.fromJson(Map<String, dynamic> json) {
    return UsersAnimeStatistics(
      daysWatched: (json['days_watched'] as num).toDouble(),
      meanScore: (json['mean_score'] as num).toDouble(),
      watching: json['watching'] as int,
      completed: json['completed'] as int,
      onHold: json['on_hold'] as int,
      dropped: json['dropped'] as int,
      planToWatch: json['plan_to_watch'] as int,
      totalEntries: json['total_entries'] as int,
      rewatched: json['rewatched'] as int,
      episodesWatched: json['episodes_watched'] as int,
    );
  }
}

class UsersMangaStatistics {
  final double daysRead;
  final double meanScore;
  final int reading;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToRead;
  final int totalEntries;
  final int reread;
  final int chaptersRead;
  final int volumesRead;

  UsersMangaStatistics({
    required this.daysRead,
    required this.meanScore,
    required this.reading,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToRead,
    required this.totalEntries,
    required this.reread,
    required this.chaptersRead,
    required this.volumesRead,
  });

  factory UsersMangaStatistics.fromJson(Map<String, dynamic> json) {
    return UsersMangaStatistics(
      daysRead: (json['days_read'] as num).toDouble(),
      meanScore: (json['mean_score'] as num).toDouble(),
      reading: json['reading'] as int,
      completed: json['completed'] as int,
      onHold: json['on_hold'] as int,
      dropped: json['dropped'] as int,
      planToRead: json['plan_to_read'] as int,
      totalEntries: json['total_entries'] as int,
      reread: json['reread'] as int,
      chaptersRead: json['chapters_read'] as int,
      volumesRead: json['volumes_read'] as int,
    );
  }
}
