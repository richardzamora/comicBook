import 'package:comicbookapp/src/pages/error_page.dart';
import 'package:comicbookapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';


final routes = <String, WidgetBuilder>{
    '/'       : (BuildContext context) => HomePage(),
    'error'   : (BuildContext context) => ErrorPage(),
};

Route<dynamic> generateRoute(RouteSettings settings){
    print(settings.name);
    return MaterialPageRoute(
      builder: (context) => ErrorPage());
  }