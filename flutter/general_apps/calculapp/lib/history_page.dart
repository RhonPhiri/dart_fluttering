import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.answers});
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: _historyPage(),
    );
  }

  Widget _historyPage() {
    if (answers.isEmpty) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset('assets/empty.png'),
      ));
    } else {
      return Container();
    }
  }
}
