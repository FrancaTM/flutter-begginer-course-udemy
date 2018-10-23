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
  bool _value1 = false;
  bool _value2 = false;
  int _value1Radio = 0;
  int _value2Radio = 0;

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

  void _value1Changed(bool value) {
    setState(() {
      _value1 = value;
    });
  }

  void _value2Changed(bool value) {
    setState(() {
      _value2 = value;
    });
  }

  void _setValue1(int value) {
    setState(() {
      _value1Radio = value;
    });
  }

  void _setValue2(int value) => setState(() => _value2Radio = value);

  Widget makeRadios() {
    List<Widget> list = new List();

    for (int i = 0; i < 3; i++) {
      list.add(
          new Radio(value: i, groupValue: _value1Radio, onChanged: _setValue1));
    }

    Column column = new Column(
      children: list,
    );
    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = new List();

    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
        value: i,
        groupValue: _value2Radio,
        onChanged: _setValue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text("Item: $i"),
        subtitle: new Text("Subtitle"),
      ));
    }

    Column column = new Column(
      children: list,
    );
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("App Title"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
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
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  onChanged: _onChanged,
                  onSubmitted: _onSubmitted,
                ),
                new Checkbox(
                  value: _value1,
                  onChanged: _value1Changed,
                ),
                new CheckboxListTile(
                  value: _value2,
                  onChanged: _value2Changed,
                  title: new Text("Hello"),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text("Subtitle"),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
                ),
                makeRadios(),
                makeRadioTiles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
