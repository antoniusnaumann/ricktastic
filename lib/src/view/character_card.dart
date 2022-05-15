import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../entity/character.dart';

class CharacterCard extends StatelessWidget {
  final Character? character;
  const CharacterCard(this.character, {Key? key}) : super(key: key);
  static const large = 200.0;
  static const medium = 150.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final imageHeight = width > medium ? width : width * 0.9;
          final typography = Theme.of(context).typography.englishLike;
          final colors = Theme.of(context).colorScheme;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              character == null 
              ? SizedBox(width: width, height: imageHeight)
              // TODO: Reveal advanced info on tap?
              : Image.network(character!.image,
                height: imageHeight, 
                width: width,
                fit: BoxFit.cover,
                excludeFromSemantics: true,
                loadingBuilder: (context, child, progress) => progress == null ? child : Shimmer.fromColors(
                  baseColor: colors.secondaryContainer.withAlpha(50),
                  highlightColor: colors.secondaryContainer.withAlpha(150),
                  child: Container(height: imageHeight, width: width, color: const Color(0xffffffff)),
                ),
                errorBuilder: (context, _, trace) => Container(height: width, width: width, color: colors.errorContainer),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(min(4.0, width / 300)),
                child: Text(character?.name ?? '', 
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: (width > medium ? (width > large ? typography.titleMedium : typography.titleSmall) : typography.labelMedium)?.copyWith(color: colors.onSecondaryContainer, fontWeight: FontWeight.w700),
                ),
              ),
              Text(character?.species ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: (width > medium ? (width > large ? typography.titleSmall : typography.labelMedium) : typography.labelSmall)?.copyWith(color: colors.onSecondaryContainer, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
            ],
          );
        },
      )
    );
  }
}