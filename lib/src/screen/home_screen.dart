import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/layout/adaptive_app_bar.dart';
import 'package:ricktastic/src/view/character_card.dart';

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
      body: [
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) => CharactersContent(title: super.widget.title, state: state)
        ),
        Center(child: Text('Coming Soon!', style: Theme.of(context).typography.englishLike.displaySmall?.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onBackground))),
      ][_tab],
    );
  }
}

class CharactersContent extends StatelessWidget {
  final String title;
  final double itemWidth;
  final CharactersState state;
  const CharactersContent({Key? key, required this.title, this.itemWidth = 250, required this.state}) : super(key: key);

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