import 'dart:convert';

import 'package:ricktastic/src/entity/character.dart';

import 'package:http/http.dart' as http;

class RickApiService {
  final String base = 'https://rickandmortyapi.com/api';

  Stream<List<Character>> fetchCharacters() async* {
    final response = await http.get(Uri.parse('$base/character'));
    // TODO: serialize
    final json = jsonDecode(response.body);
    final meta = json['info'];
    final results = (json['results'] as List)
      .map((element) => element as Map<String, dynamic>)
      .map((entry) => Character(
        id: entry['id'], 
        name: entry['name'], 
        image: entry['image'],
        url: entry['url'],
        created: entry['created']));
    
    yield results.toList();
  }
}