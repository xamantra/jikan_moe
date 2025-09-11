class UsersHistoryResponse {
  final List<UsersHistoryEntry> data;

  UsersHistoryResponse({
    required this.data,
  });

  factory UsersHistoryResponse.fromJson(Map<String, dynamic> json) {
    return UsersHistoryResponse(
      data: (json['data'] as List<dynamic>).map((item) => UsersHistoryEntry.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class UsersHistoryEntry {
  final UsersHistoryEntryData entry;
  final int increment;
  final DateTime date;

  UsersHistoryEntry({
    required this.entry,
    required this.increment,
    required this.date,
  });

  factory UsersHistoryEntry.fromJson(Map<String, dynamic> json) {
    return UsersHistoryEntry(
      entry: UsersHistoryEntryData.fromJson(json['entry'] as Map<String, dynamic>),
      increment: json['increment'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }
}

class UsersHistoryEntryData {
  final int malId;
  final String type;
  final String name;
  final String url;

  UsersHistoryEntryData({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory UsersHistoryEntryData.fromJson(Map<String, dynamic> json) {
    return UsersHistoryEntryData(
      malId: json['mal_id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
