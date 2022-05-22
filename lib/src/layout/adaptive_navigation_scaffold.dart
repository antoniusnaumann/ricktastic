import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveNavigationItem {
  final String label;
  final IconData icon;

  const AdaptiveNavigationItem({required this.label, required this.icon});
}

class AdaptiveNavigationScaffold extends StatelessWidget {
  final Widget body;
  final List<AdaptiveNavigationItem> items;
  final double breakpoint;
  final double extendedBreakpoint;
  final int currentIndex;
  final double? elevation;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;
  final Color? backgroundColor;
  final bool showRailIndicator;
  final void Function(int index) onTap;

  const AdaptiveNavigationScaffold({Key? key, 
    this.breakpoint = 1200, 
    this.extendedBreakpoint = double.maxFinite, 
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.elevation,
    this.backgroundColor,
    this.showRailIndicator = true,
    required this.items,
    required this.currentIndex,
    required this.onTap, 
    required this.body}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < breakpoint) {
      return Scaffold(
        body: body,
        bottomNavigationBar: FocusTraversalGroup(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: items.map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label)).toList(),
            onTap: (tapped) => onTap(tapped),
            currentIndex: currentIndex,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedLabelStyle: selectedLabelStyle,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedIconTheme: selectedIconTheme,
            unselectedIconTheme: unselectedIconTheme,
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            elevation: elevation,
            backgroundColor: backgroundColor
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              leading: const SizedBox(height: 16),
              extended: width > extendedBreakpoint,
              destinations: items.map((item) => NavigationRailDestination(icon: Icon(item.icon), label: Text(item.label), padding: const EdgeInsets.all(8))).toList(),
              selectedIndex: currentIndex,
              selectedLabelTextStyle: selectedLabelStyle,
              unselectedLabelTextStyle: unselectedLabelStyle,
              selectedIconTheme: selectedIconTheme,
              unselectedIconTheme: unselectedIconTheme,
              onDestinationSelected: (index) => onTap(index),
              elevation: elevation,
              backgroundColor: backgroundColor,
              useIndicator: showRailIndicator,
            ),
            Expanded(
              child: body,
            ),
          ],
        ),
      );
    }
  }
}