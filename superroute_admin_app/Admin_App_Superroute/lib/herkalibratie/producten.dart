import 'package:flutter/material.dart';

import 'stepper.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
                child: Container(
                    alignment: Alignment(0.0, 0.0),
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 220, 228, 255),
                    ),
                    child: Text(
                      '*Product*',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    )),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            stepper(),
                        transitionDuration: Duration.zero,
                      ));
                }),
            SizedBox(height: 10),
            InkWell(
                child: Container(
                    alignment: Alignment(0.0, 0.0),
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 220, 228, 255),
                    ),
                    child: Text(
                      '*Product*',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    )),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            stepper(),
                        transitionDuration: Duration.zero,
                      ));
                }),
            SizedBox(height: 10),
            InkWell(
                child: Container(
                    alignment: Alignment(0.0, 0.0),
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 220, 228, 255),
                    ),
                    child: Text(
                      '*Product*',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    )),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            stepper(),
                        transitionDuration: Duration.zero,
                      ));
                })
          ],
        ),
      ),
    );
  }
}
