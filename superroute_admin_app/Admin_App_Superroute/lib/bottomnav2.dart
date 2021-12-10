import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:superrouteadminapp/main.dart';
import 'herkalibratie.dart';
import 'herkalibratie/wegen.dart';
import 'herkalibratie/bevestig.dart';
import 'herkalibratie/succes.dart';

class btmNav2 extends StatelessWidget {
  const btmNav2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => superroute()),
                );
              },
              child: const Text(
                'Annuleer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 200, 30, 50)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wegen()),
                );
              },
              child: const Text(
                ' Verder ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 20, 39, 155)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
