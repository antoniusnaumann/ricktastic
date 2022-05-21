import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/bloc/episodes_cubit.dart';
import 'package:ricktastic/src/layout/adaptive_app_bar.dart';
import 'package:ricktastic/src/view/character_card.dart';
import 'package:ricktastic/src/view/episode_item.dart';

import '../layout/rail_scaffold.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _tab = 0;
  static const items = [
      Item(label: 'Characters', icon: Icons.person),
      Item(label: 'Episodes', icon: Icons.tv),
    ];

  @override
  Widget build(BuildContext context) {
    return RailScaffold(
      items: items,
      breakpoint: 1200,
      extendedBreakpoint: 1600,
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
    return AdaptiveAppBar(
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
    final colors = Theme.of(context).colorScheme;
    return AdaptiveAppBar(
      title: title,
      body: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: Key(index.toString()),
          direction: DismissDirection.startToEnd,
          confirmDismiss: (direction) async => false,
          background: Container(
            color: colors.primaryContainer,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(Icons.check, color: colors.onPrimaryContainer),
              ),
            ),
          ),
          child: EpisodeItem(state.episodes[index]),
        ),
        itemCount: state.entities.length,
      ),
    );
  }
}