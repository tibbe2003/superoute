import 'package:flutter/material.dart';
import 'herkalibratie_page/scan_herkalibratie_barcode.dart';

import '../Components/bottomnav.dart';
import '../Components/appbar.dart';
import 'herkalibratie_page/losse_schappen_lijst.dart';

class Herkalibratie extends StatelessWidget {
  const Herkalibratie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: const TopBar(),
          body: Stack(
            children: const [
              ProductList(),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Barcode(),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNav()),
    );
  }
}
