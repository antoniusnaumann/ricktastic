import 'dart:convert';
import 'dart:io';

import 'package:ricktastic/src/entity/character.dart';

import 'package:http/http.dart';

class RickApiService {
  final String base = 'https://rickandmortyapi.com/api';

  const RickApiService();

  /// Returns a stream that emits a page of characters from the api
  Stream<Page> fetchCharacters() async* {
    Response response;
    dynamic json;
    dynamic meta;
    var next = '$base/character';

    do {
      response = await get(Uri.parse(next));
      // TODO: Typed serialization
      json = jsonDecode(response.body);
      meta = json['info'];

      yield Page(
        content: (json['results'] as List)
          .map((element) => element as Map<String, dynamic>)
          .map((entry) => Character(
            id: entry['id'], 
            name: entry['name'], 
            image: entry['image'],
            url: entry['url'],
            created: entry['created']))
          .toList(),
        totalItems: meta['count']);

      next = meta['next'];
    } while (next.isNotEmpty);
  }
}

class Page {
  final List<Character> content;
  final int totalItems;

  Page({required this.content, required this.totalItems});
}