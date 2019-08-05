import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/model/character.dart';
import 'package:marvel_flutter_test/details/network/api.dart';
import 'package:marvel_flutter_test/details/widgets/comic_list.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  DetailsScreen(this.character);

  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.getComics(this.character.id).then((value) {
      value.forEach((comic) {
        print(comic.toString());
      });
    });

    final String description = character.description.isNotEmpty ? character.description : "No description.";

    return Scaffold(
      appBar: AppBar(
        title: Text("${character.name}"),
      ),
      body: Container(
        color: Colors.red[400],
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: <Widget>[
            Container(
                height: 265.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(character.thumbnail.path + "." + character.thumbnail.extension,)
                    )
                )),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ComicList(character.id),
          ],
        ),
      ),
    );
  }
}
