import 'package:flutter/material.dart';
import 'package:task1/screens/mainScreen.dart';
import 'package:task1/screens/scale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
