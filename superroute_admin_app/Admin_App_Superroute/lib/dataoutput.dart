import 'package:flutter/material.dart';

class output extends StatelessWidget {
  String value = '';

  void set Value(String input) {
    value = input;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 220, 228, 255),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.left,
      ),
    );
  }
}
