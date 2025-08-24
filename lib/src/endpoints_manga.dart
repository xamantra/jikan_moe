import 'dart:convert';
import 'dart:io';

import 'jikan_client.dart';
import 'manga/index.dart';

Future<MangaData> getMangaById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaDataResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaById: $trace');
    }
    rethrow;
  }
}

Future<MangaFullData> getMangaFullById(JikanClient client, int id) async {
  try {
    final response = await client.httpClient.get(Uri.parse('${client.jikanV4BaseUrl}/manga/$id/full'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MangaFullResponse.fromJson(jsonData as Map<String, dynamic>).data;
    } else {
      throw HttpException(response.body);
    }
  } catch (e, trace) {
    if (e is! HttpException) {
      print('$getMangaFullById: $trace');
    }
    rethrow;
  }
}
