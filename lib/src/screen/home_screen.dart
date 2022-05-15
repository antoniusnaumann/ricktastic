
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
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)),
      ),
      body: [
        BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: ((context, index) => CharacterCard(state.characters[index])),
              itemCount: state.characters.length,
            );
          }
        ),
        const Text('Your favorite episode'),
      ][tab],
      bottomNavigationBar: FocusTraversalGroup(
        child: BottomNavigationBar(
          items: items.map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label)).toList(),
          onTap: (tapped) => setState(() {
            tab = tapped;
          }),
          currentIndex: tab,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          elevation: 0,
        ),
      ),
    );
  }
}