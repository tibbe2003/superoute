import 'package:flutter/material.dart';
import 'package:superrouteadminapp/herkalibratie.dart';
import 'package:superrouteadminapp/herkalibratie/gekoppeld_aan.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/bevestig.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/succes.dart';
import 'package:superrouteadminapp/herkalibratie/herkal2/gescanned.dart';
import 'package:superrouteadminapp/herkalibratie/herkal2/koppel.dart';
import 'package:superrouteadminapp/herkalibratie/websockets.dart';
import 'package:superrouteadminapp/herkalibratie/herkal1/wegen.dart';
import 'package:superrouteadminapp/herkalibratie.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../herkal1/uitleg.dart';
import '../../appbar.dart';
import '../producten.dart';

void printId(int id) {
  print(id);
}

class stepper2 extends StatefulWidget {
  @override
  _stepper2State createState() => _stepper2State();
}

class _stepper2State extends State<stepper2> {
  String weight = "";
  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 0.

  // OPTIONAL: can be set directly.
  int dotCount = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const bar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: steps[activeStep],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                previousButton(),
                nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Generates jump steps for dotCount number of steps, and returns them in a row.
  var steps = <Widget>[Koppelen(), Gescanned()];

  /// Returns the next button widget.
  Widget nextButton() {
    return SizedBox(
      height: 36,
      width: 144,
      child: FloatingActionButton.extended(
        heroTag: 'nextbtn',
        onPressed: () {
          /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
          if (activeStep < dotCount - 1) {
            setState(() {
              activeStep++;
            });
          }
          if (activeStep == 2) {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      herkalibratie(),
                  transitionDuration: Duration.zero,
                ));
            activeStep = 0;
          }
        },
        label: const Text('verder'),
        backgroundColor: const Color.fromARGB(255, 20, 39, 155),
      ),
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return SizedBox(
      height: 36,
      width: 144,
      child: FloatingActionButton.extended(
        heroTag: 'cancelbtn',
        onPressed: () {
          sendStop(IOWebSocketChannel.connect('ws://www.superoute.nl'));

          /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
          activeStep = 0;
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    herkalibratie(),
                transitionDuration: Duration.zero,
              ));
        },
        label: const Text('Annuleer'),
        backgroundColor: const Color.fromARGB(255, 206, 0, 41),
      ),
    );
  }
}
