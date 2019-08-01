import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:marvel_flutter_test/characters/model/character.dart';
import 'package:marvel_flutter_test/characters/model/characters_response.dart';
import 'package:marvel_flutter_test/constraint/constraints.dart';
import 'package:marvel_flutter_test/constraint/keys.dart';
import 'package:marvel_flutter_test/cryptography/md5.dart';

class Api {
  final itemsPerPage = 20;
  final url = Constraints.baseUrl + "/v1/public/characters";
  var page = 0;
  var offset = 0;
  var lastTotalReturnedItems = 0;
  var searchTerm = "";

  Future<CharactersResponse> getAllCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();

    try{
      offset = (page * itemsPerPage);
      Map<String, dynamic> queryParameters = {
        "apikey": Keys.publicKey,
        "hash": hash,
        "ts": timestamp,
        "limit": itemsPerPage.toString(),
        "offset": offset.toString()
      };

      if (this.searchTerm.isNotEmpty && searchTerm != null) {
        queryParameters['nameStartsWith'] = searchTerm;
      }

      var response = await Dio().get(url, queryParameters: queryParameters);

      final jsonValue = jsonDecode(response.toString());
      return CharactersResponse.fromJson(jsonValue);

      page++;

    } catch (e) {
      print("An error has occuried: " + e.toString());
    }
  }

  Future<List<Character>> getCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();

    try{
      offset = (page * itemsPerPage);
      Map<String, dynamic> queryParameters = {
        "apikey": Keys.publicKey,
        "hash": hash,
        "ts": timestamp,
        "limit": itemsPerPage.toString(),
        "offset": offset.toString()
      };

      if (this.searchTerm.isNotEmpty && searchTerm != null) {
        queryParameters['nameStartsWith'] = searchTerm;
      }

      var response = await Dio().get(url, queryParameters: queryParameters);

      page++;

      final jsonValue = jsonDecode(response.toString());
      return CharactersResponse.fromJson(jsonValue).data.characters;

    } catch (e) {
      print("An error has occuried: " + e.toString());
    }
  }
}