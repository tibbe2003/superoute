import 'package:http/http.dart' as http;
import '../models/product_info_model.dart';

class HttpService {
  static Future<List<product>> fetchProducts(String productId) async {
    var response =
    await http.get(Uri.parse("http://api.superoute.nl/v2/product/1/${productId}"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productsModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}