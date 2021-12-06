import 'package:flutter/material.dart';

class titles extends StatelessWidget {
  String text;

  titles(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.left,
    );
  }
}
