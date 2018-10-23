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
  int _intValue = 0;
  String _valueTextField = "Text field input";

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

  void _add() {
    setState(() {
      _intValue++;
    });
  }

  void _subtract() {
    setState(() {
      _intValue--;
    });
  }

  void _onChanged(String value) {
    setState(() => _valueTextField = "Changed: $value");
  }

  void _onSubmitted(String value) {
    setState(() {
      _valueTextField = "Submitted: $value";
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
              new Text("Value = $_intValue"),
              new IconButton(icon: new Icon(Icons.add), onPressed: _add),
              new IconButton(
                  icon: new Icon(Icons.remove), onPressed: _subtract),
              new Text(_valueTextField),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Hello",
                  hintText: "Hint text",
                  icon: new Icon(Icons.people),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
