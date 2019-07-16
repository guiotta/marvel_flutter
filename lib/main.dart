import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/screens/characters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Characters - Flutter App',
      home: CharactersScreen(),
    );
  }
}