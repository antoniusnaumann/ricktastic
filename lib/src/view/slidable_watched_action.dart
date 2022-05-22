import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWatchedAction extends StatelessWidget {
  const SlidableWatchedAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CustomSlidableAction(
      onPressed: (context) => { },
      backgroundColor: colors.secondaryContainer,
      foregroundColor: colors.onSecondaryContainer,
      child: Container(
        color: colors.secondaryContainer,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Icon(Icons.check_rounded, color: colors.onSecondaryContainer),
              ),
              const Text('Watched'),
            ],
          ),
        ),
      ),
    );
  }
}