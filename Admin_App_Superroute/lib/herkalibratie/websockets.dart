import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

late String data = '';

sendHerkalibratie(IOWebSocketChannel channel, String id) async {
  print("Sending herkalibratie to ${id}");
  String msg = '{"client":"app","data":"herkalibratie","target":"${id}"}';
  channel.sink.add(msg);
}

sendStop(IOWebSocketChannel channel, String id) async {
  String msg = '{"client":"app","data":"schap","target":"${id}"}';
  channel.sink.add(msg);
}

channelconnect(IOWebSocketChannel channel) {
  //channel = IOWebSocketChannel.connect('ws://192.168.128.16:8000');

  channel.stream.listen((message) {
    var jsondata = json.decode(message);

    if (jsondata != null) {
      data = jsondata["data"];
    }
  });
}
