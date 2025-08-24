import 'index.dart';

class AnimeExternalResult {
  final List<AnimeExternal> data;

  const AnimeExternalResult({
    required this.data,
  });

  factory AnimeExternalResult.fromJson(Map<String, dynamic> json) {
    return AnimeExternalResult(
      data: (json['data'] as List<dynamic>).map((item) => AnimeExternal.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
