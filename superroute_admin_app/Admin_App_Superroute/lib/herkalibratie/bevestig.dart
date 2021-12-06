import 'package:flutter/material.dart';

import '../appbar.dart';
import '../bottomnav2.dart';

class Bevestig extends StatelessWidget {
  const Bevestig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: bar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Het gemeten gewicht is:',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Text(
            '0 Gram',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Als dit gewicht logisch is, sla dit op. Lijkt het gewicht incorrect? Bezoek dan de error pagina voor potentiële fouten.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          )
        ],
      ),
      bottomNavigationBar: btmNav2(),
    ));
  }
}
