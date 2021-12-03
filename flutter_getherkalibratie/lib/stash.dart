import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class scan_product extends StatefulWidget {
  const scan_product({Key? key}) : super(key: key);

  @override
  _scan_productState createState() => _scan_productState();
}

class _scan_productState extends State<scan_product> {

  late Map data;
  late List herkalibratieData;

  getData() async {
    http.Response response = await http.get(Uri.parse('http://api.superoute.nl:8000/getAssortiment/3'));
    data = json.decode(response.body);
    setState(() {
      herkalibratieData = data['result'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          color: Colors.blueAccent,
          child: ListView.builder(
              itemCount: herkalibratieData == null ? 0 : herkalibratieData.length,
              itemBuilder: (BuildContext contect, int index) {
                return Text('${herkalibratieData[index]["schapId"]}');
              }
          ),
        )
    );
  }
}


final int schapId;
final int winkelId;
final int categorieId;
final int productId;
final String schapLocatie;
final int herkalibratie;

const Data({
required this.schapId,
required this.winkelId,
required this.categorieId,
required this.productId,
required this.schapLocatie,
required this.herkalibratie,

});

factory Data.fromJson(Map<String, dynamic> json) {
return Data(
schapId: json['schapId'] as int,
winkelId: json['winkelId'] as int,
categorieId: json['categorieId'] as int,
productId: json['productId'] as int,
schapLocatie: json['schapLocatie'] as String,
herkalibratie: json['herkalibratie'] as int,
);
}