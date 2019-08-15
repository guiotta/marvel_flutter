import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/details/model/comics_response.dart';

class ComicTile extends StatelessWidget {
  Comic comic;

  ComicTile(this.comic);

  @override
  Widget build(BuildContext context) {
    if (this.comic.title == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(comic.thumbnail.path + "." + comic.thumbnail.extension)
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(comic.title,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
