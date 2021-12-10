import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import './websockets.dart' as socket;

import '../appbar.dart';
typedef void StringCallback(String val);

class wegen extends StatefulWidget {

  @override
  wegenState createState() {
    return wegenState();
  }
}

class wegenState extends State<wegen> {
  late IOWebSocketChannel channel;
  late String _client = '';
  late String _data = '';

  @override
  void initState() {
    connect();
    socket.sendHerkalibratie();
    super.initState();
  }

  connect() {
    channel = IOWebSocketChannel.connect('ws://192.168.128.16:8000');
    channel.stream.listen((message) {

      if(!mounted) {
        return;
      }

      setState(() {
        var jsondata = json.decode(message);

        if(jsondata != null) {
          _client = jsondata["client"];
          _data = jsondata["data"];
        }
      });

    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
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
        Text(_data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
