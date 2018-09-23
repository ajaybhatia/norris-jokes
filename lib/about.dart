import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
import 'package:android_intent/android_intent.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Chuck Norris Random Jokes',
              style: TextStyle(
                  fontSize: 24.0
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            CircleAvatar(
              child: Text(
                'AB',
                style: TextStyle(fontSize: 48.0),
              ),
              radius: 52.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Ajay Bhatia',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'prof.ajaybhatia@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Colors.blueAccent,
                  icon: Icon(
                    MdiIcons.facebookBox,
                    size: 36.0,
                  ),
                  onPressed: () async {
                    if (const LocalPlatform().isAndroid) {
                      AndroidIntent intent = new AndroidIntent(
                        action: 'action_view',
                        data: 'fb://facewebmodal/f?href=https://www.facebook.com/prof.ajaybhatia',
                      );
                      await intent.launch();
                    }
                  },
                ),
                IconButton(
                  color: Colors.redAccent,
                  icon: Icon(
                    MdiIcons.googlePlusBox,
                    size: 36.0,
                  ),
                  onPressed: () async {
                    if (const LocalPlatform().isAndroid) {
                      AndroidIntent intent = new AndroidIntent(
                        action: 'action_view',
                        data: 'https://plus.google.com/+AjayBhatia',
                      );
                      await intent.launch();
                    }
                  },
                ),
                IconButton(
                  color: Colors.lightBlue,
                  icon: Icon(
                    MdiIcons.twitterBox,
                    size: 36.0,
                  ),
                  onPressed: () async {
                    if (const LocalPlatform().isAndroid) {
                      AndroidIntent intent = new AndroidIntent(
                        action: 'action_view',
                        data: 'https://twitter.com/profajaybhatia',
                      );
                      await intent.launch();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
