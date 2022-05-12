import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: Extract to Router
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        titleTextStyle: Theme.of(context).typography.black.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        shape: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hello Worrld',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Episodes'),
        ],
        onTap: (tapped) => setState(() {
          tab = tapped;
        }),
        currentIndex: tab,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        elevation: 0,
      ),
    );
  }
}