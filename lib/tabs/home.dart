import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:norris_jokes/models/joke.dart';

class Home extends StatefulWidget {
  String category;

  Home(this.category);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Joke joke;

  @override
  void initState() {
    super.initState();
    _fetchRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: joke == null
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('images/chuck_norris.png'),
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    joke.value,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
    );
  }

  _fetchRandomJoke() async {
    final url = 'https://api.chucknorris.io/jokes/random?category=' + widget.category.toLowerCase();
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var decodedJson = jsonDecode(res.body);
      try {
        setState(() {
          joke = Joke.fromJson(decodedJson);
        });
      } catch (e) {}
    }
  }
}
