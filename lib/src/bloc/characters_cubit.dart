import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/service/rick_api_service.dart';

import '../entity/character.dart';

class CharactersCubit extends Cubit<CharactersState> {
  RickApiService apiService;
  CharactersCubit([this.apiService = const RickApiService()]) : super(const CharactersState()) {
    fetch();
  }

  void fetch() {
    apiService
      .fetchCharacters()
      .forEach((page) {
        final newState = state.characters.isEmpty 
          ? CharactersState(List<Character?>.generate(page.totalItems, (index) => null))
          : state;
        emit(newState.combine(page.content));
      });
  }
}

class CharactersState {
  final List<Character?> characters;
  const CharactersState([this.characters = const <Character?>[]]);

  CharactersState combine(List<Character> page) {
    var list = characters;
    for (var char in page) { list[char.id - 1] = char; }
    return CharactersState(list);
  }

  bool get isEmpty => characters.isEmpty;
}