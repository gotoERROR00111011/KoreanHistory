import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("한국사 연표"),
      ),
      body: Center(
        child: _buildStepper(),
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Stepper(
        steps: [
          _buildStep(),
        ],
      ),
    );
  }
  
  Step _buildStep() {
    return Step(
        title: Text("First"),
        subtitle: Text("subtitle"),
        content: Text("content"),
        isActive: true);
  }
}
