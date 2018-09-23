import 'package:flutter/material.dart';
import 'package:norris_jokes/tabs/home.dart';

class MyWidget extends StatefulWidget {
  List<String> categories;

  MyWidget(this.categories);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Norris Jokes'),
        bottom: TabBar(
          isScrollable: true,
          tabs: !widget.categories.isEmpty ? widget.categories.map((category) => Tab(
            text: category,
          )).toList() : [],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('images/chuck_norris.png'),
                    radius: 48.0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black54,
                  ),
                  Text('Chuck Norris', style: TextStyle(fontSize: 32.0, color: Colors.white70),)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About', style: TextStyle(fontSize: 18.0),),
              onTap: () {
                Navigator.of(context).popAndPushNamed('about');
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: widget.categories.isEmpty ? <Widget>[] : widget.categories.map((category) => Home(category)).toList(),
      ),
    );
  }
}
