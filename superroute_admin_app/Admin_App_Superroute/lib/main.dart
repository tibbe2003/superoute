import 'package:flutter/material.dart';

import 'herkalibratie.dart';
import './scan_product.dart';
import './bottomnav.dart';
import './appbar.dart';

void main() => runApp(superroute());

class superroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const bar(),
        body: scan_product(),
        bottomNavigationBar: const btmNav(),
      ),
    );
  }
}
