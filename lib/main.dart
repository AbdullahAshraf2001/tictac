import 'package:flutter/material.dart';
import 'package:tictac/GameBoard.dart';
import 'package:tictac/gameboardsplash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoard.routeName: (_) => GameBoard(),
        Gameboardsplash.routeName: (_) => Gameboardsplash(),
      },
      initialRoute: Gameboardsplash.routeName,
    );
  }
}
