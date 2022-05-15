import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Item {
  final String label;
  final IconData icon;

  const Item({required this.label, required this.icon});
}

class RailScaffold extends StatelessWidget {
  final Widget body;
  final List<Item> items;
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
    final width = MediaQuery.of(context).size.width;
    if (width < breakpoint) {
      return Scaffold(
        body: (defaultTargetPlatform == TargetPlatform.iOS && MediaQuery.of(context).orientation == Orientation.landscape) ? SafeArea(child: body) : body,
        bottomNavigationBar: FocusTraversalGroup(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: items.map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label)).toList(),
            onTap: (tapped) => onTap(tapped),
            currentIndex: currentIndex,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            elevation: 4,
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
              onDestinationSelected: (index) => onTap(index),
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