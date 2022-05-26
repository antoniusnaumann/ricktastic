import 'package:ricktastic/src/bloc/entities_cubit.dart';
import 'package:ricktastic/src/service/rick_api_service.dart';

import '../entity/episode.dart';
import '../entity/state_episode.dart';

class EpisodesCubit extends EntitiesCubit<Episode, EpisodesState> {
  EpisodesCubit({
    initialState = const EpisodesState([]), 
    RickApiService apiService = const RickApiService()
  }) : super(initialState, Episode.fromJson, 'episode', apiService);

  String _lastWatched = ''; 

  @override
  List<Episode> transform(List<Episode?> old) {
    return old
      .map((episode) =>
        _lastWatched >= episode?.code
        ? episode?.withState(EpisodeState(watched: true)) 
        : episode?.withState(EpisodeState(watched: false)))
      .whereType<Episode>()
      .toList();
  }

  void setWatched(Episode? episode) { 
    if (episode == null) return;
    _lastWatched = episode.code;
    emit(state.construct(transform(state.entities)));
  }
}

class EpisodesState extends EntitiesState<Episode, EpisodesState> {
  const EpisodesState(super.entities);

  List<Episode?> get episodes => super.entities;

  @override
  EpisodesState construct(List<Episode?> entities) => EpisodesState(entities);
}