import 'package:comicbookapp/src/models/comic.dart';
import 'package:comicbookapp/src/providers/list_comics_provider.dart';
import 'package:flutter/material.dart';

Widget gridCardComicWidget(BuildContext context)
  {
      return FutureBuilder(
        future: listComicProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot){
          if(snapshot.hasData){
          List<Widget> cards = [];
            for (var item in snapshot.data) {
              cards.add(cardComic(item));
            }
            return GridView.count(
              crossAxisCount: 4,
              children: cards,
              );
          }
          else if (snapshot.hasError)
            return Text("${snapshot.error}");
          else
            return CircularProgressIndicator();
        },
        );
  }

  Widget firstCardComicWidget(BuildContext context)
  {
      return FutureBuilder(
        future: listComicProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot){
          if(snapshot.hasData){
            Comic comic = snapshot.data[0];
            return cardComic(comic);
          }
          else if (snapshot.hasError)
            return Text("${snapshot.error}");
          else
            return CircularProgressIndicator();
        },
        );
  }

  Widget cardComic(Comic comic){
    return Container(
              child: Column(
                children: [
                  Image(image: NetworkImage(comic.imageUrl)),
                  Text(comic.name),
                  Text(comic.date),
                ],
                ),
            );
  }

