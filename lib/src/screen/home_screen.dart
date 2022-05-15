import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
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
          builder: (context, state) {
            const width = 250.0;
            final isApplePlatform = (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) && !kIsWeb;
            final colors = Theme.of(context).colorScheme;
            return NestedScrollView(
              headerSliverBuilder: (_, __) => isApplePlatform ? [
                CupertinoSliverNavigationBar(
                  largeTitle: Text(super.widget.title, style: TextStyle(color: colors.onBackground)),
                  border: null, 
                  brightness: Theme.of(context).brightness,
                  backgroundColor: colors.background.withAlpha(200),
                ),
              ] : kIsWeb ? [] : [
                SliverAppBar(
                  pinned: !kIsWeb,
                  snap: false,
                  floating: true,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(super.widget.title, style: TextStyle(color: colors.onBackground)),
                  ),
                )
              ],
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: width, childAspectRatio: 0.8),
                padding: const EdgeInsets.all(4.0),
                itemBuilder: (context, index) => CharacterCard(state.characters[index]),
                itemCount: state.characters.length,
              ),
            );
          },
        ),
        Center(child: Text('Coming Soon!', style: Theme.of(context).typography.englishLike.displaySmall?.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onBackground))),
      ][_tab],
    );
  }
}