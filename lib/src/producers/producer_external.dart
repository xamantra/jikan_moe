import 'producer_full.dart';

// Root response model for producer external
class ProducerExternalResponse {
  final List<ProducerExternal> data;

  ProducerExternalResponse({
    required this.data,
  });

  factory ProducerExternalResponse.fromJson(Map<String, dynamic> json) {
    return ProducerExternalResponse(
      data: (json['data'] as List).map((item) => ProducerExternal.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
