import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:superrouteadminapp/herkalibratie/gekoppeld_aan.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/stepper.dart';
import 'package:superrouteadminapp/herkalibratie/herkal2/stepper2.dart';
import 'package:superrouteadminapp/herkalibratie/websockets.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/wegen.dart';

typedef void IntCallback(int id);

class Barcode extends StatelessWidget {
  late final StringCallback responseData;
  Barcode({required this.responseData});

  String barcodeScanRes = 'Result';

  Future ScanBarcode() async {
    String tmp = await FlutterBarcodeScanner.scanBarcode(
        '#F00000', 'Cancel', true, ScanMode.BARCODE);
    responseData(tmp);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          width: 350,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 20, 39, 155)),
          child: const Center(
            child: Text(
              'Ontkoppel schap',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        onTap: () {
          ScanBarcode();
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    Gekoppeld_aan(),
                transitionDuration: Duration.zero,
              ));
        });
  }
}
