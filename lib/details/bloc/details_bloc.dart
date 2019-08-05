import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_flutter_test/details/model/comics_response.dart';
import 'package:marvel_flutter_test/details/network/api.dart';

class DetailsBloc extends BlocBase {
  Api _api;
  List<Comic> comics = [];

  final StreamController<List<Comic>> _comicController = StreamController<List<Comic>>();
  Stream get outComic => _comicController.stream;

  final StreamController<int> _searchController = StreamController<int>();
  Sink get inSearch => _searchController.sink;

  DetailsBloc() {
    _api = Api();

    _searchController.stream.listen(_search);
  }

  @override
  void dispose() {
    this._comicController.close();
    this._searchController.close();
  }

  void _search(int characterId) async {
    if (characterId == null) {
      comics = [];
    } else {
      comics += await _api.getComics(characterId);
    }
    _comicController.sink.add(comics);
  }
}