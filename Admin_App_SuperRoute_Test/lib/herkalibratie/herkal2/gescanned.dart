import 'package:flutter/material.dart';

class Gescanned extends StatelessWidget {
  const Gescanned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Het gescande product is',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Dorito´s sweet chili party pack",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
