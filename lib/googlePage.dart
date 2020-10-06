import 'package:flutter/material.dart';

class EmailGoogle extends StatefulWidget {
  //@override
  final Widget child;

  EmailGoogle({Key key, this.child}) : super(key: key);

  _EmailGoogleState createState() => _EmailGoogleState();
}

class _EmailGoogleState extends State<EmailGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Auth'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(5.0),
            width: 400.0,
            height: 400.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("asets/images/rocketspaces.gif"),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
