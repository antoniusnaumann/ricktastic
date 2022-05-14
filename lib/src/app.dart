import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/theme.dart';

import 'screen/home_screen.dart';

class RicktasticApp extends StatelessWidget {
  const RicktasticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ricktastic',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, 
      home: BlocProvider(
        create: (_) => CharactersCubit(),
        child: HomeScreen(title: 'Ricktastic'),
      ),
    );
  }
}