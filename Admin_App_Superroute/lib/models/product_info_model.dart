import 'dart:async';
import 'dart:convert';

List<product> productsModelFromJson(String str) =>
    List<product>.from(
        json.decode(str).map((x) => product.fromJson(x)));
//Model to parse the data and access it
class product {
  final int productId;
  final String productName;
  final int productStock;
  final String categoryName;
  final String shelfLocation;
  final double productPrice;
  final int productWeight;

  const product({
    required this.productId,
    required this.productName,
    required this.productStock,
    required this.categoryName,
    required this.shelfLocation,
    required this.productPrice,
    required this.productWeight,
  });

  factory product.fromJson(Map<String, dynamic> json) {
    return product(
      productId: json['productId'],
      productName: json['productName'],
      productStock: json['productStock'],
      categoryName: json['categoryName'],
      shelfLocation: json['shelfLocation'],
      productPrice: json['productPrice'],
      productWeight: json['productWeight'],
    );
  }
}