import 'package:adaptive_navigation_scaffold/adaptive_navigation_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RailScaffold extends StatelessWidget {
  final Widget body;
  final List<AdaptiveNavigationItem> items;
  final double breakpoint;
  final double extendedBreakpoint;
  final int currentIndex;
  final void Function(int index) onTap;

  const RailScaffold({Key? key, 
    this.breakpoint = 1200, 
    this.extendedBreakpoint = double.maxFinite, 
    required this.items,
    required this.currentIndex,
    required this.onTap, 
    required this.body}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return AdaptiveNavigationScaffold(
        breakpoint: breakpoint,
        extendedBreakpoint: extendedBreakpoint,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: 4,
        showRailIndicator: false,
        body: (defaultTargetPlatform == TargetPlatform.iOS && MediaQuery.of(context).orientation == Orientation.landscape) ? SafeArea(child: body) : body,
      );
    }
}