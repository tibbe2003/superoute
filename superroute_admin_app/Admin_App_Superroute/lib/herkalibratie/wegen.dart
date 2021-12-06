import 'package:flutter/material.dart';

import '../appbar.dart';
import '../bottomnav2.dart';

class wegen extends StatelessWidget {
  const wegen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: bar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Leg nu één product op het schap, dit moet per verkoop eenheid zijn. Wanneer het gewicht stabiel is klik verder.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Het gemeten gewicht is:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('0 Gram',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
      bottomNavigationBar: btmNav2(),
    ));
  }
}
