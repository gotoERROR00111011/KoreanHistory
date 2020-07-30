import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("한국사 연표"),
      ),
      body: Center(
        child: Text("Game"),
      ),
    );
  }
}
