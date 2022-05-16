import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/bloc/episodes_cubit.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CharactersCubit()),
          BlocProvider(create: (_) => EpisodesCubit()),
        ],
        child: const HomeScreen(title: 'Ricktastic'),
      ),
    );
  }
}