import 'package:flutter/material.dart';

import '../entity/episode.dart';

class EpisodeItem extends StatelessWidget {
  final Episode? episode;
  const EpisodeItem(this.episode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).typography.englishLike;
    final colors = Theme.of(context).colorScheme;
    final season = episode?.season;
    final episodeNumber = episode?.episode;
    final seasonEpisode = season != null ? 'Season $season · Episode $episodeNumber' : ''; 
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network('', errorBuilder: (context, error, stackTrace) => Container(width: 120, height: 72, color: colors.errorContainer,)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(episode?.name ?? 'Loading...', style: typography.titleMedium),
                Text(seasonEpisode, style: typography.subtitle1?.copyWith(color: colors.outline)),
              ],
            ),
          ),
        ],
      )
    );
  }
}