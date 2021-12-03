import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class scan_product extends StatefulWidget {
  WebSocketChannel channel = IOWebSocketChannel.connect("ws://api.superoute.nl:8000");

  @override
  scan_productState createState() {
    return scan_productState();
  }
}

class scan_productState extends State<scan_product> {

  void sendData() {
    widget.channel.sink.add("een bericht van de app!");
  }

  @override
  void close() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FloatingActionButton.extended(
            onPressed: sendData,
            label: const Text('Send message'),
            icon: const Icon(Icons.add_to_home_screen_sharp),
            backgroundColor: Colors.blue,
          ),
          StreamBuilder(
            stream: widget.channel.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    snapshot.hasData ? '${snapshot.data}' : '',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
