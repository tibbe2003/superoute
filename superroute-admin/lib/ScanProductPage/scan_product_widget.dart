// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './titles.dart';
import 'dataoutput.dart';
import 'scan_product_barcode.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

int storeId = 3;

class ScanProductWidget extends StatefulWidget {
  const ScanProductWidget({Key? key}) : super(key: key);

  @override
  State<ScanProductWidget> createState() => _ScanProductWidgetState();
}

class _ScanProductWidgetState extends State<ScanProductWidget> {
  late String productId = '0';
  late String productName = '';
  late String productStock = '';
  late String categoryName = '';
  late String shelfLocation = '';
  late String productPrice = '';
  late String productWeight = '';

  Future<void> fetchData(String productId) async {
    final response = await http.get(
        Uri.parse('http://api.superoute.nl/v2/product/$storeId/$productId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> json = jsonDecode(response.body);

      setState(() {
        productName = json[0]["productName"];
        productStock = json[0]["productStock"].toString();
        categoryName = json[0]["categoryName"];
        shelfLocation = json[0]["shelfLocation"];
        productPrice = json[0]["productPrice"].toString();
        productWeight = json[0]["productWeight"].toString();
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void updateProductId(String productid) {
    fetchData(productid);
    setState(() {
      productId = productid;
      // ignore: avoid_print
      print(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: Theme.of(context).textTheme.headline4!.fontSize! * 3 + 200.0,
        child: Center(
          child: ListView(
            children: <Widget>[
              Titles('Product nummer'),
              output(productId),
              Titles('Product naam'),
              output(productName),
              Titles('Voorraad'),
              output(productStock),
              Titles('Categorie'),
              output(categoryName),
              Titles('Positie'),
              output(shelfLocation),
              Titles('Prijs'),
              output(productPrice),
              Titles('Gewicht'),
              output(productWeight),
              Titles(''),
              Barcode(
                responseData: updateProductId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
