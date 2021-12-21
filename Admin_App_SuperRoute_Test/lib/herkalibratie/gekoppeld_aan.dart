import 'package:flutter/material.dart';
import '../appbar.dart';
import '../bottomnav.dart';
import '../herkalibratie.dart';

class Gekoppeld_aan extends StatefulWidget {
  const Gekoppeld_aan({Key? key}) : super(key: key);

  @override
  _Gekoppeld_aanState createState() => _Gekoppeld_aanState();
}

class _Gekoppeld_aanState extends State<Gekoppeld_aan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: bar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Text(
                'Het schap gekoppeld aan product nummer:',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '000001',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'En product naam:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Jumbo komkommer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: Text(
                'Weet je zeker dat je dit product wil ontkoppelen van het schap?',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          ],
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
  var steps = <Widget>[Gekoppeld_aan()];

  /// Returns the next button widget.
  Widget nextButton() {
    return SizedBox(
      height: 36,
      width: 144,
      child: FloatingActionButton.extended(
        heroTag: 'nextbtn',
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    herkalibratie(),
                transitionDuration: Duration.zero,
              ));
        },
        label: const Text('Ontkoppel'),
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
