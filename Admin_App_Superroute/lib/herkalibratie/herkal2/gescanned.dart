import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

typedef void StringCallback(String val);

class Gescanned extends StatefulWidget {
  late StringCallback callback;

  Gescanned({required this.callback});

  void returnId(String id) {
    callback(id);
  }

  @override
  _GescannedState createState() => _GescannedState(callback: returnId);
}

class _GescannedState extends State<Gescanned> {
  late String productId = "";
  late StringCallback callback;
  late String productName = "";

  _GescannedState({required this.callback});

  Future<void> fetchData(String productId) async {
    final response = await http.get(
        Uri.parse('http://api.superoute.nl/v2/getProductDetails/1/$productId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> json = jsonDecode(response.body);

      setState(() {
        productId = json[0]["productId"].toString();
        productName = json[0]["productName"];
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future ScanBarcode() async {
    String tmp = await FlutterBarcodeScanner.scanBarcode(
        '#F00000', 'Cancel', true, ScanMode.BARCODE);

    setState(() {
      productId = tmp;
      callback(tmp);
    });
    if (int.tryParse(tmp) != -1) {
      fetchData(tmp);
    }
  }

  @override
  void initState() {
    ScanBarcode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Het gescande product is',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          productName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
