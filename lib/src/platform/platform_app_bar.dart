import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// TODO: Rename e.g. PlatformScrollableScaffold
class PlatformAppBar extends StatelessWidget {
  final String title;
  final Widget body;
  const PlatformAppBar({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isApplePlatform = (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) && !kIsWeb;
    final colors = Theme.of(context).colorScheme;
    return NestedScrollView(
      headerSliverBuilder: (_, __) => isApplePlatform ? [
        CupertinoSliverNavigationBar(
          largeTitle: Text(title, style: TextStyle(color: colors.onBackground)),
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
            title: Text(title, style: TextStyle(color: colors.onBackground)),
          ),
        )
      ],
      body: body,
    );
  }
}