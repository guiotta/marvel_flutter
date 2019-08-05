import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/details/model/comics_response.dart';

class ComicTile extends StatelessWidget {
  Comic comic;

  ComicTile(this.comic);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(comic.title),
          Text(comic.description),
        ],
      ),
    );
  }
}
