import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

late String data = '';

sendHerkalibratie(IOWebSocketChannel channel) async {
  String msg = '{"client":"app","data":"herkalibratie","target":"1"}';
  channel.sink.add(msg);
}

sendStop(IOWebSocketChannel channel) async {
  String msg = '{"client":"app","data":"schap"}';
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
