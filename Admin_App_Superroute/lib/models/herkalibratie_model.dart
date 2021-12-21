import 'dart:async';
import 'dart:convert';


//Model to parse the data and access it
class Data {
  final int shelfId;
  final int storeId;
  final int categoryId;
  final int productId;
  final String shelfLocation;
  final int recalibration;
  final String productName;

  const Data({
    required this.shelfId,
    required this.storeId,
    required this.categoryId,
    required this.productId,
    required this.shelfLocation,
    required this.recalibration,
    required this.productName,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      shelfId: json['shelfId'] as int,
      storeId: json['storeId'] as int,
      categoryId: json['categoryId'] as int,
      productId: json['productId'] as int,
      shelfLocation: json['shelfLocation'] as String,
      recalibration: json['recalibration'] as int,
      productName: json['productName'] as String,
    );
  }
}