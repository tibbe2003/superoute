import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

List<Data> pasrseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

class Data {
  Data({
    required this.schapId,
    required this.schapLocatie,
  });

  int schapId;
  String schapLocatie;


  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      schapId: json['schapId'] as int,
      schapLocatie: json['schapLocatie'] as String,
    );
  }
}