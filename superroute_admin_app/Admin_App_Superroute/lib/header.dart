import 'package:flutter/material.dart';
import './titles.dart';
import './Dataoutput.dart';
import 'barcode.dart';



class table extends StatefulWidget {
  const table({Key? key}) : super(key: key);

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  late String productId = '0';

  void updateProductId(String productid) {
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
              output(productId),
              titles('Voorraad'),
              output(productId),
              titles('Categorie'),
              output(productId),
              titles('Positie'),
              output(productId),
              titles('Prijs'),
              output(productId),
              titles('Gewicht'),
              output(productId),
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
