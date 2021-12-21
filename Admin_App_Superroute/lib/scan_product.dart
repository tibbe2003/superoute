import 'package:flutter/material.dart';
import './titles.dart';
import './Dataoutput.dart';
import 'barcode.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class scan_product extends StatefulWidget {
  const scan_product({Key? key}) : super(key: key);

  @override
  State<scan_product> createState() => scan_product_state();
}

class scan_product_state extends State<scan_product> {
  late String productId = '0';
  late String productName = '';
  late String productStock = '';
  late String categoryName = '';
  late String shelfLocation = '';
  late String productPrice = '';
  late String productWeight = '';

  Future<void> fetchData(String productId) async {
    final response = await http
        .get(Uri.parse('http://api.superoute.nl/v2/product/1/${productId}'));

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
      print(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: Theme.of(context).textTheme.headline4!.fontSize! * 3 + 200.0,
        child: Center(
          child: ListView(
            children: <Widget>[
              titles('Product nummer'),
              output(productId),
              titles('Product naam'),
              output(productName),
              titles('Voorraad'),
              output(productStock),
              titles('Categorie'),
              output(categoryName),
              titles('Positie'),
              output(shelfLocation),
              titles('Prijs'),
              output(productPrice),
              titles('Gewicht'),
              output(productWeight),
              titles(''),
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