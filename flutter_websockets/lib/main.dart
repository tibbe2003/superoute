import 'package:flutter/material.dart';

import './scan_product.dart';
import './appbar.dart';


void main() => runApp(superroute());

class superroute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: bar(),
        body: scan_product(),
      ),
    );
  }
}
