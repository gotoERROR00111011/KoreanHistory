import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:korean_history/bulls_and_cows.dart';
import 'package:korean_history/history_list.dart';

class GamePage extends StatefulWidget {
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  Game game = new Game();
  static KoreanHistory history = new KoreanHistory();
  static List<List<String>> events = history.getEvents();

  int gameCount = 0;
  List<Widget> gameRecord = List<Widget>();

  int _currentIntValue = 0;
  NumberPicker numberPickers;

  void _initializeNumberPicker() {
    numberPickers = new NumberPicker.integer(
      initialValue: _currentIntValue,
      minValue: 0,
      maxValue: 9,
      step: 1,
      onChanged: (value) => setState(() => _currentIntValue = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('한국사 연표'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _quiz(),
          _record(),
          _play(),
        ],
      )),
    );
  }

  Widget _quiz() {
    List<String> event = events[game.getAnswer()];
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.history),
            title: Text(
                '${event.reduce((value, element) => value + '\n' + element)}'),
            subtitle: Text('이 사건이 일어난 연도는?'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('New Game'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _play() {
    _initializeNumberPicker();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _picker(),
          _try(),
        ],
      ),
    );
  }

  Widget _picker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        numberPickers,
      ],
    );
  }

  Widget _try() {
    return ButtonTheme(
      minWidth: 500.0,
      height: 50.0,
      child: RaisedButton(
        onPressed: () {},
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: const Text("Try", style: TextStyle(fontSize: 30)),
      ),
    );
  }

  Widget _record() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: gameRecord,
    );
  }

  Widget _score() {
    gameCount++;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Text('$gameCount'),
            title: Text('1999'),
            subtitle: Text('0 Strike, 0 Ball'),
          ),
        ],
      ),
    );
    //gameRecord.add(Text('TEST'));
    //setState(() {});
  }
}
