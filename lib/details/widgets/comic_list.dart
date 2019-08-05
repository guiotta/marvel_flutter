import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/details/bloc/details_bloc.dart';
import 'package:marvel_flutter_test/details/widgets/comic_tile.dart';

class ComicList extends StatelessWidget {
  int _charactersId;

  ComicList(this._charactersId);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DetailsBloc>(context);
    bloc.inSearch.add(this._charactersId);

    return StreamBuilder(
        stream: BlocProvider.of<DetailsBloc>(context).outComic,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return ComicTile(snapshot.data[index]);
                } else if (index > 1) {
                  bloc.inSearch.add(_charactersId);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      );
  }
}
