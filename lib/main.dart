import 'package:flutter/material.dart';
import 'dart:async';

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
  bool _value1Switch = false;
  bool _value2Switch = false;
  double _valueSlider = 0.0;
  String _valueDatePicker = "";
  String _valueSection3Assignment = "";
  String _display = "";
  String _valueFAB = "FAB date here!";

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

  void _onChanged1(bool value) {
    setState(() {
      _value1Switch = value;
    });
  }

  void _onChanged2(bool value) {
    setState(() {
      _value2Switch = value;
    });
  }

  void _setValueSlider(double value) {
    setState(() {
      _valueSlider = value;
    });
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2019),
    );

    if (picked != null) {
      setState(() {
        _valueDatePicker = picked.toString();
      });
    }
  }

  void _onChangedSection3Assignment(String value) {
    setState(() {
      _valueSection3Assignment = value;
    });
  }

  void _onPressedSection3Assignment() {
    setState(() {
      _display = _valueSection3Assignment;
    });
  }

  void _onPressedFAB() {
    setState(() {
      _valueFAB = new DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "App Title ($_intValue)",
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _subtract),
        ],
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text("Drawer"),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Close"),
              ),
            ],
          ),
        ),
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
                new Text(
                  "Value = $_intValue",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 37.0,
                  ),
                ),
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
                new Switch(value: _value1Switch, onChanged: _onChanged1),
                new SwitchListTile(
                  value: _value2Switch,
                  onChanged: _onChanged2,
                  title: new Text(
                    "Switch",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                new Text("Value: ${(_valueSlider * 100).round()}"),
                new Slider(value: _valueSlider, onChanged: _setValueSlider),
                new Text(_valueDatePicker),
                new RaisedButton(
                  onPressed: _selectDate,
                  child: new Text("Select date"),
                ),
                new Text(_display),
                new TextField(onChanged: _onChangedSection3Assignment),
                new RaisedButton(
                  onPressed: _onPressedSection3Assignment,
                  child: new Text("Enter"),
                ),
                new Text(_valueFAB),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressedFAB,
        backgroundColor: Colors.purple,
        mini: false,
        child: new Icon(Icons.timer),
      ),
    );
  }
}
