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

enum Answers { YES, NO, MAYBE }

class _MyAppState extends State<MyApp> {
  /// Variables
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
  String _valueSection3Assignment = "Section 3 assignment value here!";
  String _display = "";
  String _valueFAB = "FAB date here!";
  String _valueFooter = "Footer buttons value here!";
  List<BottomNavigationBarItem> _bnbItems;
  String _valueBnb = "Bottom navigation bar value here!";
  int _index = 0;
  String _valueSection4Assignment = "Section 4 assignment value here!";
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  String _simpleDialogValue = "Simple dialog executed?";
  String _valueSection5Assignment = "Section 5 assignment value here!";
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();

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

  void _onPressedFooter1(String value) {
    setState(() {
      _valueFooter = value;
    });
  }

  void _onPressedSection4Assignment() {
    setState(() {
      _valueSection4Assignment = new DateTime.now().toString();
    });
    Navigator.pop(context);
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Bottom sheet info here!",
                style: new TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Close sheet"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackBar() {
    _scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: new Text("Snack bar here!"),
      ),
    );
  }

  Future _showAlertDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(message),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text("OK"),
          ),
        ],
      ),
    );
  }

  void _setSimpleDialogValue(String value) =>
      setState(() => _simpleDialogValue = value);

  Future _askUser() async {
    switch (await showDialog(
      context: context,
      child: new SimpleDialog(
        title: new Text("Simple Alert"),
        children: <Widget>[
          new SimpleDialogOption(
            child: new Text("Yes"),
            onPressed: () {
              Navigator.pop(context, Answers.YES);
            },
          ),
          new SimpleDialogOption(
            child: new Text("No"),
            onPressed: () {
              Navigator.pop(context, Answers.NO);
            },
          ),
          new SimpleDialogOption(
            child: new Text("Maybe"),
            onPressed: () {
              Navigator.pop(context, Answers.MAYBE);
            },
          ),
        ],
      ),
    )) {
      case Answers.YES:
        _setSimpleDialogValue("Yes");
        break;
      case Answers.NO:
        _setSimpleDialogValue("No");
        break;
      case Answers.MAYBE:
        _setSimpleDialogValue("Maybe");
        break;
    }
  }

  /// Section 5 assignment
  void _onChangedSection5Assignment(String value) {
    setState(() {
      _valueSection5Assignment = value;
    });
  }

  void _showSnackBarSection5Assignment(String message) {
    _scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: new Text(message),
      ),
    );
  }

  @override
  void initState() {
    _bnbItems = new List();
    _bnbItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.people), title: new Text("People")));
    _bnbItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.weekend), title: new Text("Weekend")));
    _bnbItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.message), title: new Text("Message")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
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
              new Text("Section 4 assignment"),
              new RaisedButton(
                onPressed: _onPressedSection4Assignment,
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
                new Text(_valueFooter),
                new Text(_valueBnb),
                new Text(_valueSection4Assignment),
                new RaisedButton(
                  onPressed: _showBottomSheet,
                  child: new Text("Show bottom sheet"),
                ),
                new RaisedButton(
                  onPressed: _showSnackBar,
                  child: new Text("Show snack bar"),
                ),
                new RaisedButton(
                  onPressed: () =>
                      _showAlertDialog(context, "Simple alert dialog!"),
                  child: new Text("Button"),
                ),
                new Text(_simpleDialogValue),
                new RaisedButton(
                  onPressed: _askUser,
                  child: new Text(
                    "Simple dialog",
                  ),
                ),
                new Text("Enter your name:"),
                new TextField(
                  onChanged: _onChangedSection5Assignment,
                ),
                new RaisedButton(
                  onPressed: () => _showSnackBarSection5Assignment(
                      "Hello $_valueSection5Assignment"),
                  child: new Text("Enter"),
                ),
                new Text("Please login"),
                new Row(
                  children: <Widget>[
                    new Text("Username: "),
                    new Expanded(
                      child: new TextField(
                        controller: _user,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("Password: "),
                    new Expanded(
                      child: new TextField(
                        controller: _password,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.all(32.0),
                  child: new RaisedButton(
                    onPressed: () => debugPrint("Login ${_user.text}"),
                    child: new Text("Button"),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text("Card text"),
                        new Text("Another card text"),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text("Card text"),
                        new Text("Another card text"),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text("Card text"),
                        new Text("Another card text"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
            icon: new Icon(Icons.timer),
            onPressed: () => _onPressedFooter1("Footer button 1")),
        new IconButton(
            icon: new Icon(Icons.people),
            onPressed: () => _onPressedFooter1("Footer button 2")),
        new IconButton(
            icon: new Icon(Icons.map),
            onPressed: () => _onPressedFooter1("Footer button 3")),
      ],
      bottomNavigationBar: new BottomNavigationBar(
        items: _bnbItems,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState(() {
            _index = item;
            _valueBnb = "Current value is: ${_index.toString()}";
          });
        },
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
