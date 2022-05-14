import 'package:flutter/material.dart';

import '../entity/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(character.name),
          Text('Location: ${character.location?.name ?? 'unknown'}'),
          Text('Gender: ${character.gender ?? 'unknown'}'),
          Text('Species: ${character.species ?? 'unknown'}'),
          Text('Status: ${character.status ?? 'unknown'}'),
        ]
      ),
    );
  }

}