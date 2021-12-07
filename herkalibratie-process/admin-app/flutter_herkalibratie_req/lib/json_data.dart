import 'dart:async';
import 'dart:convert';


//Model to parse the data and access it
class Data {
  final int schapId;
  final int winkelId;
  final int categorieId;
  final int productId;
  final String schapLocatie;
  final int herkalibratie;

  const Data({
    required this.schapId,
    required this.winkelId,
    required this.categorieId,
    required this.productId,
    required this.schapLocatie,
    required this.herkalibratie,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      schapId: json['schapId'] as int,
      winkelId: json['winkelId'] as int,
      categorieId: json['categorieId'] as int,
      productId: json['productId'] as int,
      schapLocatie: json['schapLocatie'] as String,
      herkalibratie: json['herkalibratie'] as int,
    );
  }
}