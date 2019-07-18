import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marvel_flutter_test/characters/bloc/characters_bloc.dart';
import 'package:marvel_flutter_test/characters/presenter/characters_presenter.dart';
import 'package:marvel_flutter_test/characters/widgets/characters_tile.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharactersBloc>(context);
    bloc.inSearch.add(null);

    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Characters - Flutter App"),
      ),
      backgroundColor: Colors.red[400],
      body: StreamBuilder(
        stream: BlocProvider.of<CharactersBloc>(context).outCharacters,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return CharactersTile(snapshot.data[index]);
                } else if (index > 1) {
                  bloc.inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      )
    );
  }
}