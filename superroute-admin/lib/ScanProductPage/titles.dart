import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  String text;

  Titles(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.left,
    );
  }
}
