import 'index.dart';

class MangaExternalResult {
  final List<MangaExternal> data;

  const MangaExternalResult({
    required this.data,
  });

  factory MangaExternalResult.fromJson(Map<String, dynamic> json) {
    return MangaExternalResult(
      data: (json['data'] as List<dynamic>).map((item) => MangaExternal.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
