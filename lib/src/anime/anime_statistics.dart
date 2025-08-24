class AnimeStatistics {
  final AnimeStatisticsData data;

  const AnimeStatistics({
    required this.data,
  });

  factory AnimeStatistics.fromJson(Map<String, dynamic> json) {
    return AnimeStatistics(
      data: AnimeStatisticsData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AnimeStatisticsData {
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;
  final int total;
  final List<AnimeScore> scores;

  const AnimeStatisticsData({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
    required this.total,
    required this.scores,
  });

  factory AnimeStatisticsData.fromJson(Map<String, dynamic> json) {
    return AnimeStatisticsData(
      watching: json['watching'] as int? ?? 0,
      completed: json['completed'] as int? ?? 0,
      onHold: json['on_hold'] as int? ?? 0,
      dropped: json['dropped'] as int? ?? 0,
      planToWatch: json['plan_to_watch'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      scores: (json['scores'] as List<dynamic>?)?.map((e) => AnimeScore.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'watching': watching,
      'completed': completed,
      'on_hold': onHold,
      'dropped': dropped,
      'plan_to_watch': planToWatch,
      'total': total,
      'scores': scores.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AnimeStatisticsData(watching: $watching, completed: $completed, onHold: $onHold, dropped: $dropped, planToWatch: $planToWatch, total: $total, scores: <${scores.length} items>)';
  }
}

class AnimeScore {
  final int score;
  final int votes;
  final double percentage;

  const AnimeScore({
    required this.score,
    required this.votes,
    required this.percentage,
  });

  factory AnimeScore.fromJson(Map<String, dynamic> json) {
    return AnimeScore(
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
