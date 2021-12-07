import 'package:flutter/material.dart';
import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

import '../appbar.dart';
import '../bottomnav2.dart';
import './producten.dart';

class uitleg extends StatefulWidget {
  const uitleg({Key? key}) : super(key: key);

  @override
  _uitlegState createState() => _uitlegState();
}

class _uitlegState extends State<uitleg> {
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

              /// Jump buttons.
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: steps[activeStep],
                  )
              ),

              // Next and Previous buttons.
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
  var steps = <Widget>[
    const Text("test"),
    const Text("Test2"),
    const Text("Test3"),
    const Text("Test4"),
    const Text("Test5"),
  ];

  /// Returns the next button widget.
  Widget nextButton() {
    return SizedBox(
      height: 36,
      width: 144,
      child: FloatingActionButton.extended(
        onPressed: () {
          /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
          if (activeStep < dotCount - 1) {
            setState(() {
              activeStep++;
            });
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
        onPressed: () {
          /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
          if (activeStep > 0) {
            setState(() {
              activeStep--;
            });
          }
        },
        label: const Text('Annuleer'),
        backgroundColor: const Color.fromARGB(255, 206, 0, 41),
      ),
    );
  }
}
