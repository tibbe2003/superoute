import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import './stepper.dart';

import './json_data.dart';

//Getting data from api en parsing it with json
Future<List<Data>> fetchData(http.Client client) async {
  final response = await http
      .get(Uri.parse('http://api.superoute.nl:8000/v2/recalibration/1'));

  return compute(parseData, response.body);
}

//Converting response body to List of type Data
List<Data> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

String parseLocation(String input) {
  List<String> LocationArr = input.split('.');
  String output = "Locatie: ";

  switch(LocationArr[0]) {
    case '1':
      output += "agf";
      break;
    case '2':
      output += "vvp";
      break;
    case '3':
      output += "tapas";
      break;
    case '4':
      output += "non-food";
      break;
    case '5':
      output += "vriezer";
      break;
    case '6':
      output += "chips";
      break;
  }

  output += ", meter: "+LocationArr[1]+", plank: "+LocationArr[2]+", positie: "+LocationArr[3];

  return output;
}

class productList extends StatefulWidget {
  const productList({Key? key}) : super(key: key);

  @override
  productListState createState() => productListState();
}

class productListState extends State<productList> {
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
    return Container(
      width: Theme.of(context).textTheme.headline4!.fontSize! * 3 + 250,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
                width: 10,
                height: 53,
                margin: EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 220, 228, 255),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      parseLocation(data[index].shelfLocation),
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data[index].productName,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          stepper(data[index].shelfId),
                      transitionDuration: Duration.zero,
                    ));
              });
        },
      ),
    );
  }
}
