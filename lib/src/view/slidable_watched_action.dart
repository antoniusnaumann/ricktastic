import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWatchedAction extends StatelessWidget {
  final Function(BuildContext context) action;
  const SlidableWatchedAction({Key? key, this.action = _empty}) : super(key: key);

  static void _empty(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CustomSlidableAction(
      onPressed: (context) => action(context),
      backgroundColor: Colors.transparent,
      foregroundColor: colors.onSecondaryContainer,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Icon(Icons.check_rounded, color: colors.onSecondaryContainer),
            ),
            const Text('Watched', overflow: TextOverflow.fade, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}