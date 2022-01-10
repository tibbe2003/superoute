import 'package:flutter/material.dart';

class Koppelen extends StatefulWidget {
  String shelfLocation = "";
  Koppelen(this.shelfLocation, {Key? key}) : super(key: key);

  @override
  _KoppelenState createState() => _KoppelenState();
}

class _KoppelenState extends State<Koppelen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Center(
          child: Text(
            'Je staat op het punt een schap op de locatie',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.shelfLocation,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'te koppelen aan een nieuw product. Scan het product om de koppeling te voltooien.',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
