import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/model/characters_response.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  DetailsScreen(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${character.name}"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
                height: 250.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(character.thumbnail.path + "." + character.thumbnail.extension,)
                    )
                )),
          ],
        ),
      ),
    );
  }
}
