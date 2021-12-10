import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../../superroute_admin_app/Admin_App_Superroute/lib/herkalibratie/json_data.dart';

//Getting data from api en parsing it with json
Future<List<Data>> fetchData(http.Client client) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint("hij doet het");
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
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
    );
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
        return Container(
          width: 100,
          height: 50,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            data[index].shelfLocation,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
