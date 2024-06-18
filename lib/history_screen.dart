import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> historyItems = [
    'Flight from NYC to LA',
    'Flight from SF to Tokyo',
    'Flight from Paris to London',
    'Flight from Berlin to Rome',
    'Flight from Sydney to Melbourne',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(historyItems[index]),
          );
        },
      ),
    );
  }
}
