import 'package:flutter/material.dart';
import './titles.dart';
import './Dataoutput.dart';

class table extends StatelessWidget {
  const table({Key? key}) : super(key: key);

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
              output(),
              titles('Product naam'),
              output(),
              titles('Voorraad'),
              output(),
              titles('Categorie'),
              output(),
              titles('Positie'),
              output(),
              titles('Prijs'),
              output(),
              titles('Gewicht'),
              output(),
            ],
          ),
        ),
      ),
    );
  }
}
