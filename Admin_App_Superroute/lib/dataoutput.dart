import 'package:flutter/material.dart';

class output extends StatelessWidget {
  String value = '';

  output(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 40),
      margin: EdgeInsets.only(top: 5, bottom: 10),
      padding: EdgeInsets.all(5),
      width: double.infinity,
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
