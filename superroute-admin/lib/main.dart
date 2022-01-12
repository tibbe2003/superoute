import 'package:flutter/material.dart';

import 'ScanProductPage/ScanProductTableWidget.dart';
import 'Components/bottomnav.dart';
import 'Components/appbar.dart';

void main() => runApp(const Superroute());

class Superroute extends StatelessWidget {
  const Superroute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TopBar(),
        body: ProductScanTable(),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
