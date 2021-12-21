import 'package:flutter/material.dart';
import 'herkalibratie/herkalbarcode.dart';
import 'package:superrouteadminapp/herkalibratie/producten.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/stepper.dart';

import './bottomnav.dart';
import './appbar.dart';
import 'herkalibratie/producten.dart';

class herkalibratie extends StatelessWidget {
  const herkalibratie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: bar(),
            body: Column(
              children: [
                productList(),
                SizedBox(
                  height: 5,
                ),
                Barcode(
                  responseData: (String val) {},
                ),
              ],
            ),
            bottomNavigationBar: btmNav()));
  }
}
