import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../entity/character.dart';

class CharacterCard extends StatelessWidget {
  final Character? character;
  final double width;
  const CharacterCard(this.character, {this.width = 200, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        child: Column(
          children: [
            character == null 
            ? SizedBox(width: width, height: width)
            : Image.network(character!.image, 
                height: width,
                width: width,
                excludeFromSemantics: true,
                loadingBuilder: (context, child, progress) => progress == null ? child : Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer.withAlpha(50),
                  highlightColor: Theme.of(context).colorScheme.secondaryContainer.withAlpha(150),
                  child: Container(height: width, width: width, color: const Color(0xffffffff)),
                ),
                errorBuilder: (context, _, trace) => Text(trace.toString()),
              ),
            Text(character?.name ?? ''),
            Text('Gender: ${character?.gender ?? ''}'),
            Text('Species: ${character?.species ?? ''}'),
            Text('Status: ${character?.status ?? ''}'),
          ]
        ),
      ),
    );
  }
}