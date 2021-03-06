import 'dart:math';

import 'package:adaptive_navigation_scaffold/adaptive_navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/bloc/episodes_cubit.dart';
import 'package:ricktastic/src/screen/episode_screen.dart';
import 'package:ricktastic/src/view/character_card.dart';
import 'package:ricktastic/src/view/episode_item.dart';
import 'package:ricktastic/src/view/slidable_watched_action.dart';

import '../platform/platform_app_bar.dart';
import '../view/rail_scaffold.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _tab = 0;
  static const items = [
      AdaptiveNavigationItem(label: 'Characters', icon: Icons.person),
      AdaptiveNavigationItem(label: 'Episodes', icon: Icons.tv),
    ];

  @override
  Widget build(BuildContext context) {
    return RailScaffold(
      items: items,
      breakpoint: 1000,
      extendedBreakpoint: 1400,
      currentIndex: _tab,
      onTap: (index) => setState(() {
        _tab = index;
      }),
      body: <Widget>[
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) => CharactersContent(title: super.widget.title, state: state),
        ),
        BlocBuilder<EpisodesCubit, EpisodesState>(
          builder: (context, state) => EpisodesContent(title: super.widget.title, state: state),
        ),
      ][_tab],
    );
  }
}

class CharactersContent extends StatelessWidget {
  final String title;
  final double itemWidth;
  final CharactersState state;
  const CharactersContent({super.key, required this.title, this.itemWidth = 250, required this.state});

  @override
  Widget build(BuildContext context) {
    return PlatformAppBar(
      title: title,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: itemWidth, childAspectRatio: 0.8),
        padding: const EdgeInsets.all(4.0),
        itemBuilder: (context, index) => CharacterCard(state.characters[index]),
        itemCount: state.characters.length,
      ),
    );
  }
}

class EpisodesContent extends StatelessWidget {
  final String title;
  final EpisodesState state;
  const EpisodesContent({super.key, required this.title, required this.state});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PlatformAppBar(
      title: title,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Slidable(
            key: Key(index.toString()),
            startActionPane: ActionPane(
              // TODO: Replace with proper dismissable which activates on swipe
              // dismissible: SlidableWatchedAction(),
              extentRatio: min(1, 5 / sqrt(width)),
              motion: const StretchMotion(),
              children: [
                SlidableWatchedAction(action: ((context) => context.read<EpisodesCubit>().setWatched(state.episodes[index]))),
              ],
            ),
            child: InkWell(
              onTap: () { 
                final episode = state.episodes[index];
                if(episode != null) { 
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => EpisodeScreen(episode: episode)
                  ));
                }
              },
              child: EpisodeItem(state.episodes[index]),
            )
          );
        },
        itemCount: state.entities.length,
      ),
    );
  }
}