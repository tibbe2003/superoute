import 'package:flutter/material.dart';

import './req_button.dart';
import './appbar.dart';


void main() => runApp(superroute());

class superroute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: bar(),
        body: req_button(),
      ),
    );
  }
}