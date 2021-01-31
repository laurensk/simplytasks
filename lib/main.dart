import 'package:flutter/material.dart';
import 'package:simplytasks/screens/home.dart';

void main() {
  runApp(SimplytasksApp());
}

class SimplytasksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplytasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}
