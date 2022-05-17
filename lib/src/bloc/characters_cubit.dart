import 'package:ricktastic/src/bloc/entities_cubit.dart';
import 'package:ricktastic/src/service/rick_api_service.dart';

import '../entity/character.dart';

class CharactersCubit extends EntitiesCubit<Character, CharactersState> {
  CharactersCubit({initialState = const CharactersState([]), RickApiService apiService = const RickApiService()}) : super(initialState, Character.fromJson, 'character', apiService);
}

class CharactersState extends EntitiesState<Character, CharactersState> {
  const CharactersState(super.entities);

  get characters => entities;
  
  @override
  CharactersState construct(List<Character?> entities) => CharactersState(entities);
}