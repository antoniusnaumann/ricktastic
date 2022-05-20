import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/entity.dart';
import '../service/rick_api_service.dart';

abstract class EntitiesCubit<S extends Entity, T extends EntitiesState<S, T>> extends Cubit<T> {
  RickApiService apiService;

  S Function(Map<String, dynamic> entry) fromJson;
  String urlKey;
  EntitiesCubit(super.initialState, this.fromJson, this.urlKey, [this.apiService = const RickApiService()]) {
    fetch();
  }

  void fetch() {
    apiService
      .fetch(fromJson, urlKey)
      .forEach((page) {
        final newState = state.entities.isEmpty 
          ? state.construct(List<S?>.generate(page.totalItems, (index) => null))
          : state;
        emit(newState.combine(transform(page.content)));
      });
  }

  List<S> transform(List<S> old) {
    return old;
  }
}

abstract class EntitiesState<S extends Entity, T extends EntitiesState<S, T>> {
  final List<S?> entities;
  const EntitiesState(this.entities);

  T construct(List<S?> entities);
  T combine(List<S> page) {
    var list = entities;
    for (var e in page) { list[e.id - 1] = e; }
    return construct(list);
  }

  bool get isEmpty => entities.isEmpty;
}