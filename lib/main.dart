import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/bloc/characters_bloc.dart';
import 'package:marvel_flutter_test/characters/screens/characters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CharactersBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Marvel Characters - Flutter App',
        home: CharactersScreen(),
      ),
    );
  }
}