import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

late IOWebSocketChannel channel;

sendHerkalibratie() async {
  channelconnect();
  String msg = '{"client":"app","data":"herkalibratie"}';
  channel.sink.add(msg);
}

sendStop() async {
  channelconnect();
  String msg = '{"client":"app","data":"finished"}';
  channel.sink.add(msg);
}

channelconnect() {
  //function to connect
  channel = IOWebSocketChannel.connect('ws://192.168.128.16:8000');
}

String latestData() {
  String data = "Niks";
  channelconnect();
  String msg = '{"client":"app","data":"latest"}';
  channel.sink.add(msg);

    channel.stream.listen((message) {

        var jsondata = json.decode(message);
        if(jsondata["data"] != null) {
          if(int.tryParse(jsondata["data"]) != null) {
            data = jsondata["data"];
            print(data);
          }
        }
        channel.sink.close();

    });

  print('data: ${data}');
  return data;
}
