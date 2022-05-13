import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: Colors.green,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black87,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: Colors.green,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white70,
  ),
);