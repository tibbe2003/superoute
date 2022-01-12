import 'package:flutter/material.dart';
import 'package:superroute_admin/Herkalibratie/KoppelSchap/gescanned.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

typedef IntCallback = void Function(int id);

// ignore: must_be_immutable
class Barcode extends StatelessWidget {
  late final StringCallback responseData;
  Barcode({Key? key, required this.responseData}) : super(key: key);

  String barcodeScanRes = 'Result';

  // ignore: non_constant_identifier_names
  Future ScanBarcode() async {
    String tmp = await FlutterBarcodeScanner.scanBarcode(
        '#F00000', 'Cancel', true, ScanMode.BARCODE);
    responseData(tmp);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 20, 39, 155)),
        child: const Center(
          child: Text(
            'Scan Barcode',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      onTap: ScanBarcode,
    );
  }
}
