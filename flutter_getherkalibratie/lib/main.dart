import 'package:flutter/material.dart';

import './herkalibratie_lijst.dart';
import '../../flutter_herkalibratie_req/lib/appbar.dart';


void main() => runApp(superroute());

class superroute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: bar(),
        body: herkalibratie(),
      ),
    );
  }
}
