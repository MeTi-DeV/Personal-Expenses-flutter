import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses')),
      body: Column(
        children: [
          Container(
            
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
            ),
          ),
          Card(
            child: Text('LIST OF TX '),
          )
        ],
      ),
    );
  }
}
