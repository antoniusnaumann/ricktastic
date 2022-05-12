import 'package:flutter/material.dart';
import 'package:ricktastic/src/theme.dart';

import 'view/home_screen.dart';

class RicktasticApp extends StatelessWidget {
  const RicktasticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, 
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}