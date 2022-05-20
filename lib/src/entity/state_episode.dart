import 'package:ricktastic/src/entity/episode.dart';

class EpisodeState {
  final bool watched;

  EpisodeState({required this.watched});
}

class StateEpisode extends Episode implements EpisodeState {
  @override
  final bool watched;

  StateEpisode({
    required super.id,
    required super.name,
    super.airDate,
    required super.code,
    super.characterUrls,
    required super.url,
    required super.created,
    this.watched = false,
  });

  factory StateEpisode.fromEpisode(Episode episode, EpisodeState state) {
    return StateEpisode(
      id: episode.id,
      name: episode.name,
      airDate: episode.airDate,
      code: episode.code,
      characterUrls: episode.characterUrls,
      url: episode.url,
      created: episode.created,
      watched: state.watched,
    );
  }
}

extension EpisodeWithState on Episode {
  StateEpisode withState(EpisodeState state) => StateEpisode.fromEpisode(this, state);
}