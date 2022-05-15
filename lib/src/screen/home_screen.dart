import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/view/character_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Item {
  final String label;
  final IconData icon;

  const Item({required this.label, required this.icon});
}

class _HomeScreenState extends State<HomeScreen> {
  var tab = 0;

  final items = [
    const Item(label: 'Characters', icon: Icons.person),
    const Item(label: 'Episodes', icon: Icons.tv),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            const width = 250.0;
            final isApplePlatform = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS;
            final colors = Theme.of(context).colorScheme;
            return NestedScrollView(
              headerSliverBuilder: (_, __) => [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Ricktastic", style: TextStyle(color: isApplePlatform ? colors.onBackground : colors.onSecondaryContainer)),
                  border: null, 
                  brightness: Theme.of(context).brightness,
                  backgroundColor: isApplePlatform ? colors.background.withAlpha(200) : colors.secondaryContainer,
                ),
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
        const Text('Your favorite episode'),
      ][tab],
      bottomNavigationBar: FocusTraversalGroup(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: items.map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label)).toList(),
          onTap: (tapped) => setState(() {
            tab = tapped;
          }),
          currentIndex: tab,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          elevation: 4,
        ),
      ),
    );
  }
}