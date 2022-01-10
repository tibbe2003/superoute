import 'package:flutter/material.dart';
import 'herkalibratie/herkalbarcode.dart';
import 'package:superrouteadminapp/herkalibratie/producten.dart';

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
          body: Stack(
            children: [
              const productList(),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Barcode(),
              ),
            ],
          ),
          bottomNavigationBar: btmNav()),
    );
  }
}
