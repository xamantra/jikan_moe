import 'index.dart';

class AnimeStreamingResult {
  final List<AnimeStreaming> data;

  const AnimeStreamingResult({
    required this.data,
  });

  factory AnimeStreamingResult.fromJson(Map<String, dynamic> json) {
    return AnimeStreamingResult(
      data: (json['data'] as List<dynamic>).map((item) => AnimeStreaming.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AnimeStreaming(data: $data)';
  }
}
