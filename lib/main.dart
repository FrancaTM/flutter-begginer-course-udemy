import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = "Hello";

  void _onPressedRaised(String value) {
    setState(() {
      _value = value;
    });
  }

  void _onPressedFlat() {
    setState(() {
      _value = new DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("App Title"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(
                onPressed: () => _onPressedRaised("Updated value!"),
                child: new Text("Raised button"),
              ),
              new FlatButton(
                onPressed: _onPressedFlat,
                child: new Text("Flat button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
