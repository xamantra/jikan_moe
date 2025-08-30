import 'dart:convert';

import 'jikan_client.dart';
import 'magazines/magazines_get.dart';

Future<MagazinesResponse> getMagazines(
  JikanClient client, {
  int? page,
  int? limit,
  String? q,
  String? orderBy,
  String? sort,
  String? letter,
}) async {
  final queryParams = <String, String>{};

  if (page != null) queryParams['page'] = page.toString();
  if (limit != null) queryParams['limit'] = limit.toString();
  if (q != null) queryParams['q'] = q;
  if (orderBy != null) queryParams['order_by'] = orderBy;
  if (sort != null) queryParams['sort'] = sort;
  if (letter != null) queryParams['letter'] = letter;

  final uri = Uri.parse('${client.jikanV4BaseUrl}/magazines').replace(queryParameters: queryParams.isNotEmpty ? queryParams : null);

  final response = await client.httpClient.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MagazinesResponse.fromJson(json);
  } else {
    throw Exception('Failed to load magazines: ${response.statusCode}');
  }
}
