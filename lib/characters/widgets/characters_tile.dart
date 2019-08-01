import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/model/character.dart';
import 'package:marvel_flutter_test/details/screens/details_screen.dart';

class CharactersTile extends StatelessWidget {
  final Character character;

  CharactersTile(this.character);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(this.character)
            ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
              child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(character.thumbnail.path + "." + character.thumbnail.extension,)
                      )
                  )),
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
