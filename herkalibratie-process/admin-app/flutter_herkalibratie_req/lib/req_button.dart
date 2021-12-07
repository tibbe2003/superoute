import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

import './json_data.dart';

class req_button extends StatefulWidget {

  @override
  req_button_state createState() {
    return req_button_state();
  }
}

class req_button_state extends State<req_button> {
  late IOWebSocketChannel channel;
  late String _client = '';
  late String _data = '';

  @override
  void initState() {
    channelconnect();
    super.initState();
  }

  channelconnect() {
    //function to connect
      channel = IOWebSocketChannel.connect('ws://localhost:8000');
      channel.stream.listen((message) {

        print(message);

        setState(() {
        var jsondata = json.decode(message);

        _client = jsondata["client"];
        _data = jsondata["data"];
        });
    });
  }

  sendmsg() async {
    String msg = '{"client":"app","data":"herkalibratie"}';
    channel.sink.add(msg);
  }

  sendStop() async {
    String msg = '{"client":"app","data":"finished"}';
    channel.sink.add(msg);
  }

  @override
  void close() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FloatingActionButton.extended(
            onPressed: sendmsg,
            label: const Text('start herkalibratie'),
            icon: const Icon(Icons.add_to_home_screen_sharp),
            backgroundColor: Colors.blue,
          ),
          Text(
            _data,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          FloatingActionButton.extended(
            onPressed: sendStop,
            label: const Text('finish herkalibratie'),
            icon: const Icon(Icons.add_to_home_screen_sharp),
            backgroundColor: Colors.blue,),
        ],
      ),
    );
  }
}
