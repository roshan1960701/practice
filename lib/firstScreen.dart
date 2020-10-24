import 'package:flutter/material.dart';

class firstScreen extends StatefulWidget {
  String Value;
  firstScreen({this.Value});
  @override
  _firstScreenState createState() => _firstScreenState(Value);
}

class _firstScreenState extends State<firstScreen> {
  String Value;
  _firstScreenState(this.Value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(Value)),
    );
  }
}
