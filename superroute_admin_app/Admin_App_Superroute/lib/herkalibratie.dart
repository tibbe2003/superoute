import 'package:flutter/material.dart';
import 'package:superrouteadminapp/herkalibratie/producten.dart';
import 'package:superrouteadminapp/herkalibratie/uitleg.dart';

import './bottomnav.dart';
import './appbar.dart';
import 'herkalibratie/producten.dart';

class herkalibratie extends StatelessWidget {
  const herkalibratie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: const bar(),
            body: ProductList(),
            bottomNavigationBar: btmNav()));
  }
}
