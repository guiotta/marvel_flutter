import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/model/characters_response.dart';

class CharactersTile extends StatelessWidget {
  final Character character;

  CharactersTile(this.character);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(children: <Widget>[
          Flexible(
            flex: 1,
            child: Image.network(
              character.thumbnail.path + "." + character.thumbnail.extension,
              fit: BoxFit.fill,
              height: 160.0,
              width: 160.0,
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                      '#${character.id}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                      )
                  ),
                  Text(
                      character.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            )
          )
        ]),
      ),
    );
  }
}
