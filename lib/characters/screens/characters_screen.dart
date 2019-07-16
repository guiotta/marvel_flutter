import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/presenter/characters_presenter.dart';

class CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersPresenter _charactersPresenter;

  @override
  void initState() {
    super.initState();
    _charactersPresenter = CharactersPresenter();
    _charactersPresenter.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Characters - Flutter App"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
