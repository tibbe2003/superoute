import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Components/appbar.dart';
import '../herkalibratie_widget.dart';
import 'gescanned.dart';
import 'koppel.dart';

int storeId = 3;

// ignore: must_be_immutable
class KoppelProcess extends StatefulWidget {
  String shelfLocation;
  String shelfId;
  KoppelProcess(this.shelfLocation, this.shelfId, {Key? key}) : super(key: key);

  @override
  _KoppelProcessState createState() => _KoppelProcessState();
}

class _KoppelProcessState extends State<KoppelProcess> {
  static String shelfLocation = "";
  int activeStep = 0;
  int dotCount = 5;
  String productId = "";
  String shelfId = "";
  var steps = <Widget>[];
  String barcodeScanRes = '2';

  @override
  void initState() {
    shelfLocation = widget.shelfLocation;
    shelfId = widget.shelfId;
    steps.add(Koppelen(shelfLocation));
    steps.add(Gescanned(
      callback: (val) => setState(() {
        productId = val;
        linkReq(shelfId, productId);
      }),
    ));
    super.initState();
  }

  linkReq(String shelfId, String productId) async {
    final response = await http.post(
      Uri.parse('http://api.superoute.nl/v2/linkProduct/$storeId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'shelfId': shelfId, 'productId': productId}),
    );

    if (response.statusCode == 200) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const TopBar(),
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
          if (activeStep >= 2) {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const Herkalibratie(),
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
          activeStep = 0;
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const Herkalibratie(),
                transitionDuration: Duration.zero,
              ));
        },
        label: const Text('Annuleer'),
        backgroundColor: const Color.fromARGB(255, 206, 0, 41),
      ),
    );
  }
}
