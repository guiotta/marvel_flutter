import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/details/bloc/details_bloc.dart';
import 'package:marvel_flutter_test/details/widgets/comic_tile.dart';

class ComicList extends StatelessWidget {
  int _charactersId;
  int _comicsListSize = -1;

  ComicList(this._charactersId);

  @override
  Widget build(BuildContext context) {
    final bloc = DetailsBloc();
    bloc.inSearch.add(this._charactersId);
    bloc.outComic.drain();

    return StreamBuilder(
        stream: bloc.outComic,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length && snapshot.data[index] != null) {
                  return ComicTile(snapshot.data[index]);
                } else if (index > 1 && _comicsListSize != snapshot.data.length) {
                  // Recebe o tamanho da lista com os comics.
                  // Se o snapshot vier com o mesmo tamanho 2 vezes, não tenta mais atualziar os dados com o servidor.
                  _comicsListSize = snapshot.data.length;
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
