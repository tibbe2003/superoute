import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import '../websockets.dart' as socket;

import '../../appbar.dart';

typedef void StringCallback(String val);

class wegen extends StatefulWidget {
  IOWebSocketChannel channel;
  wegen(this.channel);

  @override
  wegenState createState() {
    return wegenState();
  }
}

class wegenState extends State<wegen> {
  String data = '';

  getData() {
    widget.channel.stream.listen((message) {
      if (!mounted) {
        return;
      }

      var jsondata = json.decode(message);

      setState(() {
        if (jsondata != null) {
          data = jsondata["data"];
        }
        print(data);
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Leg nu één product op het schap, dit moet per verkoop eenheid zijn. Wanneer het gewicht stabiel is klik verder.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 20.0),
        const Text(
          'Het gemeten gewicht is:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
