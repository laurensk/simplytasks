import 'package:flutter/material.dart';
import 'package:simplytasks/widgets/custom_scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Simplytasks",
      body: Container(
        child: Center(
          child: Text("Welcome to Simplytasks."),
        ),
      ),
    );
  }
}
