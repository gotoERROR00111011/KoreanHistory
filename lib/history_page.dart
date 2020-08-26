import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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

    ScrollController _rrectController = ScrollController();

    return DraggableScrollbar.rrect(
      controller: _rrectController,
      backgroundColor: Colors.blue,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        controller: _rrectController,
        itemCount: years.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(context, years[index], events[years[index]]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
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

class SemicircleDemo extends StatelessWidget {
  static int numItems = 1000;

  final ScrollController controller;

  const SemicircleDemo({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.semicircle(
      labelTextBuilder: (offset) {
        final int currentItem = controller.hasClients
            ? (controller.offset /
                    controller.position.maxScrollExtent *
                    numItems)
                .floor()
            : 0;

        return Text("$currentItem");
      },
      labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
      controller: controller,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: numItems,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(2.0),
            color: Colors.grey[300],
          );
        },
      ),
    );
  }
}
