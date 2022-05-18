


import 'package:ricktastic/src/entity/character.dart';
import 'package:ricktastic/src/service/rick_api_service.dart';

class MockRickApiService implements RickApiService {
  @override
  String get base => throw UnimplementedError();

  @override
  Stream<Page<T>> fetch<T>(T Function(Map<String, dynamic> entry) fromJson, [String urlKey = '']) async* {
    if (T != Character) return;
    
    for (final page in mockCharacterPages) {
      yield page as Page<T>;
      // sleep(const Duration(milliseconds: 50));
    }
  }
}

final mockCharacterPages = List<Page<Character>>.generate(50, (page) {
  const charsPerPage = 100;
  return Page(totalItems: charsPerPage * 50, content: List<Character>.generate(charsPerPage, (index) => Character(
    id: _idFromPage(page, index, charsPerPage),
    name: 'Bototron X${_idFromPage(page, index, charsPerPage)}',
    species: 'Testbot',
    image: '',
    url: '',
    created: DateTime.now().toIso8601String(),
  )));
});

int _idFromPage(int page, int index, int charsPerPage) => charsPerPage * page + index + 1;