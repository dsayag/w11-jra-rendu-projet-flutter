import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Loading Demo',
        home: Scaffold(
            body: Center(
          child: Text(
            'Loading...',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )));
  }
}
