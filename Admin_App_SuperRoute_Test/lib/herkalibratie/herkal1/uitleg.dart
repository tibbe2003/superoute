import 'package:flutter/material.dart';

import '../../appbar.dart';

class uitleg extends StatelessWidget {
  const uitleg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Om een nieuw gewicht te meten, zorg dat alle producten van het schap zijn en dat het schap leeg is.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
