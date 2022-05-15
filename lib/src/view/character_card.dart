import 'package:flutter/material.dart';

import '../entity/character.dart';

class CharacterCard extends StatelessWidget {
  final Character? character;
  const CharacterCard(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: character == null ? const [
          Text(''),
          Text(''),
          Text(''),
          Text(''),
          Text(''),
        ] : [
          Text(character!.name),
          Text('Location: ${character!.location?.name ?? 'null'}'),
          Text('Gender: ${character!.gender ?? 'null'}'),
          Text('Species: ${character!.species ?? 'null'}'),
          Text('Status: ${character!.status ?? 'null'}'),
        ]
      ),
    );
  }
}