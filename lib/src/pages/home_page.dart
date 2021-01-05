import 'package:comicbookapp/src/Widgets/grid_card_widget.dart';
import 'package:comicbookapp/src/providers/list_comics_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              _generateHeader(),
              Divider(),
              SizedBox(height: 25,),
              firstCardComicWidget(context),
            ],
          ),
    );
  }

  Widget _generateHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25,),
        Center(
          child: Text('ComicBook',
          style: TextStyle(fontSize: 30,), 
          ),),
        Divider(),
        Row(
            children: [
            SizedBox(width: 20,),
            Text('Latest Issues'),
            Expanded(child: SizedBox(),),
            Flexible(child:_listGridButtons()),
            ],
          ),
      ],
    );
  }

  Widget _listGridButtons(){

    return Row(
      children: [
        Flexible(
          child: TextButton(
            onPressed: (){}, 
            child: Text('List')
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: (){}, 
            child: Text('Grid')
          ),
        ),
      ],
    );
  }

  Widget _comic(BuildContext context)
  {
      return FutureBuilder(
        future: listComicProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot){
          if(snapshot.hasData)
            return Text('${snapshot.data}');
          else if (snapshot.hasError)
            return Text("${snapshot.error}");
          else
            return CircularProgressIndicator();
        },
        );
  }
}