import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superroute_admin/Components/appbar.dart';
import 'dart:convert';

import '../herkalibratie_widget.dart';

int storeId = 3;

// ignore: must_be_immutable
class GekoppeldAan extends StatefulWidget {
  String schapId;
  GekoppeldAan(this.schapId, {Key? key}) : super(key: key);

  @override
  _GekoppeldAanState createState() => _GekoppeldAanState();
}

class _GekoppeldAanState extends State<GekoppeldAan> {
  late String productId = "0";
  late String productName = "";
  late String shelfId = "0";

  unlinkReq(String shelfId) async {
    final response = await http.delete(
        Uri.parse('http://api.superoute.nl/v2/linkProduct/$storeId/$shelfId'));

    if (response.statusCode == 200) {}
  }

  Future<void> fetchData(String shelfId) async {
    final response = await http
        .get(Uri.parse('http://api.superoute.nl/v2/product/$storeId/$shelfId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> json = jsonDecode(response.body);

      if (!json.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const Herkalibratie(),
              transitionDuration: Duration.zero,
            ));
      } else {
        setState(() {
          productId = json[0]["productId"].toString();
          productName = json[0]["productName"];
        });
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    if (widget.schapId != "0") {
      fetchData(widget.schapId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const TopBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: const Text(
                'Het schap gekoppeld aan product nummer:',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productId,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'En product naam:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: const Text(
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

  /// Returns the next button widget.
  Widget nextButton() {
    return SizedBox(
      height: 36,
      width: 144,
      child: FloatingActionButton.extended(
        heroTag: 'nextbtn',
        onPressed: () {
          if (widget.schapId != "0") {
            unlinkReq(widget.schapId);
          }
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const Herkalibratie(),
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
