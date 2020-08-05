import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:korean_history/bulls_and_cows.dart';
import 'package:korean_history/history_list.dart';

class GamePage extends StatefulWidget {
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  static KoreanHistory history = new KoreanHistory();
  static List<List<String>> events = history.getEvents();

  Game game = new Game();
  int gameCount = 0;
  List<Widget> gameRecord = List<Widget>();
  List<int> _currentIntValue = [1, 9, 9, 5];
  List<NumberPicker> numberPickers = List<NumberPicker>(4);

  void _initializeNumberPicker() {
    for (int i = 0; i < 4; ++i) {
      numberPickers[i] = new NumberPicker.integer(
        initialValue: _currentIntValue[i],
        minValue: 0,
        maxValue: 9,
        step: 1,
        onChanged: (value) => setState(() => _currentIntValue[i] = value),
      );
    }
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
          _buildQuiz(),
          _buildPlay(),
          _buildRecord(),
        ],
      )),
    );
  }

  Widget _buildQuiz() {
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

  Widget _buildPlay() {
    _initializeNumberPicker();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildNumberPicekr(),
          _buildTryButton(),
        ],
      ),
    );
  }

  Widget _buildNumberPicekr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        numberPickers[0],
        numberPickers[1],
        numberPickers[2],
        numberPickers[3],
      ],
    );
  }

  Widget _buildTryButton() {
    return ButtonTheme(
      minWidth: 500.0,
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          _buildScore();
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: const Text("Try", style: TextStyle(fontSize: 30)),
      ),
    );
  }

  Widget _buildRecord() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: gameRecord,
    );
  }

  void _buildScore() {
    int myAnswer = 0;
    for (int i = 0; i < 4; ++i) {
      myAnswer *= 10;
      myAnswer += _currentIntValue[i];
    }
    gameCount++;
    gameRecord.add(Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Text('$gameCount'),
            title: Text('$myAnswer, ${game.getAnswer()}'),
            subtitle: Text('0 Strike, 0 Ball'),
          ),
        ],
      ),
    ));
    setState(() {});
  }
}
