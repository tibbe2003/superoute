
//Model to parse the data and access it
class Data {
  final int shelfId;
  final String categorieName;
  final String shelfLocation;

  const Data({
    required this.shelfId,
    required this.categorieName,
    required this.shelfLocation,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        shelfId: json['shelfId'] as int,
        shelfLocation: json['shelfLocation'] as String,
        categorieName: json['categoryName'] as String);
  }
}
