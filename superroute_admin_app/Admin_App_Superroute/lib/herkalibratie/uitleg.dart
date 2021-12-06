import 'package:flutter/material.dart';

import '../appbar.dart';
import '../bottomnav2.dart';

class Uitleg extends StatelessWidget {
  const Uitleg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          appBar: bar(),
          body: Center(
            child: Text(
              'Om een nieuw gewicht te meten, zorg dat alle producten van het schap zijn en dat het schap leeg is.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          bottomNavigationBar: btmNav2()),
    );
  }
}
