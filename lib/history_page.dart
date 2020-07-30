import 'package:flutter/material.dart';
import 'package:korean_history/history_list.dart';

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
        child: _buildEvents(),
      ),
    );
  }

  Widget _buildEvents() {
    KoreanHistory history = new KoreanHistory();
    List<int> years = history.getYears();
    List<List<String>> events = history.getEvents();

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: years.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(context, years[index], events[years[index]]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(BuildContext context, int year, List<String> event) {
    return ListTile(
      title: Text("${year}년"),
      subtitle:
          Text("${event.reduce((value, element) => value + '\n' + element)}"),
      onTap: () {},
    );
  }
}
