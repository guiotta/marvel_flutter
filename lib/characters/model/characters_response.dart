import 'package:marvel_flutter_test/characters/model/data.dart';

class CharactersResponse {
  Data data;

  CharactersResponse(this.data);


  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(json['data'] != null ? new Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
  }
}