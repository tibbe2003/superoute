import 'package:flutter/material.dart';

class Koppelen extends StatelessWidget {
  const Koppelen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Center(
          child: Text(
            'Je staat op het punt een schap op de locatie',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Chips, meter 2, plank 5, positie 3',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'te koppelen aan een nieuw product. Scan het product om de koppeling te voltooien.',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
