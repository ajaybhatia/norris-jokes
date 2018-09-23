import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norris_jokes/about.dart';
import 'dart:convert';

import 'package:norris_jokes/mywidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = new List();

    _loadTabs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Norris Jokes',
      home: categories.length > 0
          ? DefaultTabController(
              length: categories.length,
              child: MyWidget(categories),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('Norris Jokes'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
      routes: <String, WidgetBuilder>{
        'about': (BuildContext context) => About(),
      },
    );
  }

  void _loadTabs() async {
    var res = await http.get('https://api.chucknorris.io/jokes/categories');
    if (res.statusCode == 200) {
      for (final category in jsonDecode(res.body)) {
        categories.add(category.toString().toUpperCase());
      }

      setState(() {});
    }
  }
}
