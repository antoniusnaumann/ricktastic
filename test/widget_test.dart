// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ricktastic/src/bloc/characters_cubit.dart';
import 'package:ricktastic/src/screen/home_screen.dart';
import 'package:ricktastic/src/theme.dart';

import 'mock/mock_rick_api_service.dart';

void main() {
  testWidgets('Find navigation title', (WidgetTester tester) async {
    await tester.pumpWidget(setupApp());

    if (kIsWeb) {
      expect(find.text('Ricktastic'), findsNothing);
    } else {
      expect(find.text('Ricktastic'), findsOneWidget);
    }
  });

  testWidgets('Verify characters are loaded', (WidgetTester tester) async {
    await tester.pumpWidget(setupApp());

    await tester.pump(const Duration(milliseconds: 10));

    expect(find.text('Bototron X1'), findsOneWidget);
    expect(find.text('Testbot'), findsWidgets);
  });

  testWidgets('Tap episodes tab and ensure content changes', (WidgetTester tester) async {
    await tester.pumpWidget(setupApp());

    expect(find.text('Coming Soon!'), findsNothing);
    expect(find.text('Episodes'), findsOneWidget);
    expect(find.byIcon(Icons.tv), findsOneWidget);
    
    await tester.tap(find.byIcon(Icons.tv));
    await tester.pump(const Duration(milliseconds: 10));

    expect(find.text('Coming Soon!'), findsOneWidget);
  });
}

Widget setupApp() => MaterialApp(
  title: 'Ricktastic',
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system, 
  home: BlocProvider(
    create: (_) => CharactersCubit(MockRickApiService()),
    child: const HomeScreen(title: 'Ricktastic'),
  ),
);
