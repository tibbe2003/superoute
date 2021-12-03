import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import './json_data.dart';

//Getting data from api en parsing it with json
Future<List<Data>> fetchData(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://api.superoute.nl:8000/herkalibratie/3'));

  return compute(parseData, response.body);
}

//Converting response body to List of type Data
List<Data> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

class herkalibratie extends StatefulWidget {
  const herkalibratie({Key? key}) : super(key: key);

  @override
  _herkalibratieState createState() => _herkalibratieState();
}

class _herkalibratieState extends State<herkalibratie> {
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
