import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:marvel_flutter_test/constraint/constraints.dart';
import 'package:marvel_flutter_test/constraint/keys.dart';
import 'package:marvel_flutter_test/cryptography/md5.dart';
import 'package:marvel_flutter_test/details/model/comics_response.dart';

class Api {
  final itemsPerPage = 20;
  final url = Constraints.baseUrl + "/v1/public/comics";
  var page = 0;
  var offset = 0;
  var lastTotalReturnedItems = 0;
  var searchTerm = "";

  Future<List<Comic>> getComics(int characterId) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();

    try{
      offset = (page * itemsPerPage);
      Map<String, dynamic> queryParameters = {
        "apikey": Keys.publicKey,
        "hash": hash,
        "ts": timestamp,
        "limit": itemsPerPage.toString(),
        "offset": offset.toString(),
        "characters": characterId.toString()
      };

      if (this.searchTerm.isNotEmpty && searchTerm != null) {
        queryParameters['nameStartsWith'] = searchTerm;
      }

      var response = await Dio().get(url, queryParameters: queryParameters);

      page++;
      final jsonValue = jsonDecode(response.toString());
      return ComicsResponse.fromJson(jsonValue).data.comics;

    } catch (e) {
      print("An error has occuried: " + e.toString());
    }
  }
}