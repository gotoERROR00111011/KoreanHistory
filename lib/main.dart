import 'package:flutter/material.dart';
import 'package:korean_history/game_page.dart';
import 'package:korean_history/history_page.dart';
//import 'bulls_and_cows.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kor, Korea, Korean',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("한국사 연표"),
        ),
        body: _buildMenu());
  }

  Widget _buildMenu() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[_play(), _whiteSpace(), _history()],
    ));
  }

  Widget _play() {
    return ButtonTheme(
      minWidth: 300.0,
      height: 100.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamePage()),
          );
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: const Text("Play", style: TextStyle(fontSize: 50)),
      ),
    );
  }

  Widget _history() {
    return ButtonTheme(
      minWidth: 300.0,
      height: 100.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: const Text("History", style: TextStyle(fontSize: 50)),
      ),
    );
  }

  Widget _whiteSpace() {
    return const SizedBox(height: 30);
  }
}
