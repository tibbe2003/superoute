import 'package:flutter/material.dart';

// ignore: must_be_immutable
class output extends StatelessWidget {
  String value = '';

  output(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      padding: const EdgeInsets.all(5),
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
