import 'package:flutter/material.dart';

import 'history_page.dart';

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
  final List<String> _menu = <String>["게임", "연표"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("한국사 연표"),
        ),
        body: Center(
          child: _buildMenu(),
        ));
  }

  Widget _buildMenu() {
    return ListView.builder(
        itemCount: _menu.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(context, index);
        });
  }

  Widget _buildRow(BuildContext context, int index) {
    return ListTile(
      title: Text(_menu[index]),
      subtitle: Text('Here is a second line'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
        );
      },
    );
  }
}
