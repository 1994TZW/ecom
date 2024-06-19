import 'dart:async';
import 'dart:convert';
import '../const.dart';
import '../vo/product.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  Future<List<Product>> getProducts(String categoryId) async {
    List<Product> products = [];

    try {
      var response =
          await http.read(Uri.parse('$apiURL/products/category/$categoryId'));
      var itemData = jsonDecode(response) as Map<String, dynamic>;
      List<dynamic> list = itemData['products'];
      products =
          list.map((e) => Product.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e) {
      print("error:$e");
      throw [];
    }
    return products;
  }
}
