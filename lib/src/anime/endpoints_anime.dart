import 'dart:convert';
import 'dart:io';

import '../jikan_client.dart';
import 'anime_full.dart';

Future<AnimeFullData> getAnimeFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/anime/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AnimeFullData.fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getAnimeFullById: $trace');
    }
    rethrow;
  }
}
