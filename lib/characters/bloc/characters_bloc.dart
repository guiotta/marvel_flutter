import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_flutter_test/characters/model/characters_response.dart';
import 'package:marvel_flutter_test/characters/network/api.dart';

class CharactersBloc implements BlocBase {
  Api _api;
  List<Character> characters = [];

  final StreamController<List<Character>> _charactersController = StreamController<List<Character>>();
  Stream get outCharacters => _charactersController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  CharactersBloc() {
    _api = Api();

    _searchController.stream.listen(_search);
  }

  @override
  void dispose() {
    _charactersController.close();
    _searchController.close();
  }

  void _search(String search) async {
    if (search != null && !search.isEmpty) {
      _charactersController.sink.add([]);
      //videos = await _api.search(search);
    } else {
     // videos += await _api.nextPage();
      characters += await _api.getCharacters();
    }

    _charactersController.sink.add(characters);
  }

}