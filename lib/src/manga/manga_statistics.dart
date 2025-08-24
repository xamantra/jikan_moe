class MangaStatistics {
  final MangaStatisticsData data;

  const MangaStatistics({
    required this.data,
  });

  factory MangaStatistics.fromJson(Map<String, dynamic> json) {
    return MangaStatistics(
      data: MangaStatisticsData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class MangaStatisticsData {
  final int reading;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToRead;
  final int total;
  final List<MangaScore> scores;

  const MangaStatisticsData({
    required this.reading,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToRead,
    required this.total,
    required this.scores,
  });

  factory MangaStatisticsData.fromJson(Map<String, dynamic> json) {
    return MangaStatisticsData(
      reading: json['reading'] as int? ?? 0,
      completed: json['completed'] as int? ?? 0,
      onHold: json['on_hold'] as int? ?? 0,
      dropped: json['dropped'] as int? ?? 0,
      planToRead: json['plan_to_read'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      scores: (json['scores'] as List<dynamic>?)?.map((e) => MangaScore.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reading': reading,
      'completed': completed,
      'on_hold': onHold,
      'dropped': dropped,
      'plan_to_read': planToRead,
      'total': total,
      'scores': scores.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'MangaStatisticsData(reading: $reading, completed: $completed, onHold: $onHold, dropped: $dropped, planToRead: $planToRead, total: $total, scores: <${scores.length} items>)';
  }
}

class MangaScore {
  final int score;
  final int votes;
  final double percentage;

  const MangaScore({
    required this.score,
    required this.votes,
    required this.percentage,
  });

  factory MangaScore.fromJson(Map<String, dynamic> json) {
    return MangaScore(
      score: json['score'] as int,
      votes: json['votes'] as int? ?? 0,
      percentage: (json['percentage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'votes': votes,
      'percentage': percentage,
    };
  }
}
