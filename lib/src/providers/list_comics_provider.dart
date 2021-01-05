import 'dart:convert';
import 'dart:io';
import 'package:comicbookapp/src/models/comic.dart';
import 'package:http/http.dart' as http;


class _ListComicProvider{

  _ListComicProvider(){
    cargarData();
  }

  Future<List<Comic>> cargarData() async{
    final response = await http.get('https://comicvine.gamespot.com/api/issues/?api_key=460df2015d76d815bb35d4aecf2a769b0a16d8ed&format=json');

    if(response.statusCode == 200)
    {
      Map mapComics = json.decode(response.body);
      List<dynamic> comics= mapComics["results"];
      List<Comic> listComics = [];
      for (var item in comics) {
        Comic comic = Comic(imageUrl: item['image']['original_url'], date: item['date_added'], name: "${item['name']} #${item['issue_number']}");
        listComics.add(comic);
      }
      return listComics;
    }
    print('Error to Load data');
    return null;
  }

}

final listComicProvider = new _ListComicProvider();