import 'package:flutter/material.dart';

import 'view/home_screen.dart';

class RicktasticApp extends StatelessWidget {
  const RicktasticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}