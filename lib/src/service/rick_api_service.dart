import 'dart:convert';

import 'package:ricktastic/src/entity/character.dart';

import 'package:http/http.dart';

class RickApiService {
  final String base = 'https://rickandmortyapi.com/api';

  const RickApiService();

  /// Returns a stream that emits a page of characters from the api
  Stream<Page<T>> fetch<T>(T Function(Map<String, dynamic> entry) fromJson, String urlKey) async* {
    Response response;
    dynamic json;
    dynamic meta;
    var next = '$base/$urlKey';

    do {
      response = await get(Uri.parse(next));
      json = jsonDecode(response.body);
      meta = json['info'];

      yield Page(
        content: (json['results'] as List)
          .map((element) => element as Map<String, dynamic>)
          .map((entry) => fromJson(entry))
          .toList(),
        totalItems: meta['count']);

      next = meta['next'] ?? '';
    } while (next.isNotEmpty);
  }
}

class Page<T> {
  final List<T> content;
  final int totalItems;

  Page({required this.content, required this.totalItems});
}