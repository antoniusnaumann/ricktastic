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
  List<Episode> transform(List<Episode> old) {
    return old.map((episode) => episode.withState(EpisodeState(watched: episode.season! < 3))).toList();
  }
}

class EpisodesState extends EntitiesState<Episode, EpisodesState> {
  const EpisodesState(super.entities);

  List<Episode?> get episodes => super.entities;

  @override
  EpisodesState construct(List<Episode?> entities) => EpisodesState(entities);
}