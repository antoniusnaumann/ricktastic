import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ricktastic/src/entity/episode.dart';

import '../platform/platform_check.dart';

class EpisodeScreen extends StatelessWidget {
  final Episode episode;
  const EpisodeScreen({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      color: colors.background,
      padding: EdgeInsets.only(top: PlatformCheck.isMacApp ? 24 : 0),
      child: Scaffold(
        appBar: (PlatformCheck.isApplePlatform ? 
          CupertinoNavigationBar(
            middle: Text(episode.name, style: TextStyle(color: colors.onBackground)),
            border: null, 
            brightness: Theme.of(context).brightness,
            backgroundColor: colors.background.withAlpha(200),
          ) : AppBar(
            title: Text(episode.name),
          ) as PreferredSizeWidget
        ),
      ),
    );
  }
}