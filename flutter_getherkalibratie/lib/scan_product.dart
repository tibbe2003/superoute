import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<Data>> fetchData(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://api.superoute.nl:8000/herkalibratie/3'));

  // Use the compute function to run parsePhotos in a separate isolate.
  debugPrint(response.body);
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Data> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

class Data {
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
}

class scan_product extends StatefulWidget {
  const scan_product({Key? key}) : super(key: key);

  @override
  _scan_productState createState() => _scan_productState();
}

class _scan_productState extends State<scan_product> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blueAccent,
      child: FutureBuilder<List<Data>>(
        future: fetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            return DataList(data: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}

class DataList extends StatelessWidget {
  const DataList({Key? key, required this.data}) : super(key: key);

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Text(data[index].schapLocatie);
      },
    );
  }
}
