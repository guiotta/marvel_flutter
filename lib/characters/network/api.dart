import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:marvel_flutter_test/characters/model/characters_response.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:marvel_flutter_test/constraint/constraints.dart';
import 'package:marvel_flutter_test/constraint/keys.dart';

class Api {
  final itemsPerPage = 20;
  final url = Constraints.baseUrl + "/v1/public/characters";
  var page = 0;
  var offset = 0;
  var lastTotalReturnedItems = 0;
  var searchTerm = "";

  Future<CharactersResponse> getAllCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(timestamp + Keys.privateKey + Keys.publicKey).toString();

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
    final hash = _generateMd5(timestamp + Keys.privateKey + Keys.publicKey).toString();

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

  _generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}