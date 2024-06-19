import 'dart:async';
import 'dart:convert';
import 'package:logging/logging.dart';

import '../const.dart';
import '../vo/category.dart';
import '../vo/item.dart';
import 'package:http/http.dart' as http;

class CategoryModel {
  final log = Logger('CategoryModel');

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];

    try {
      var response = await http.read(Uri.parse('$apiURL/products/categories'));
      var categoryList = jsonDecode(response) as List<dynamic>;

      for (var e in categoryList) {
        Category c = Category.fromMap(e as Map<String, dynamic>);
  
        var response =
            await http.read(Uri.parse('$apiURL/products/category/${c.id}'));
        var itemData = jsonDecode(response) as Map<String, dynamic>;
        List<dynamic> list = itemData['products'];

        // get image url
        if (list.isNotEmpty) {
          var firstItem = Item.fromMap(list.first as Map<String, dynamic>);
          c.imageUrl = firstItem.thumbnail;
        }
        categories.add(c);
      }
      log.info("getCategories:$categories");
    } catch (e) {
      print("error:$e");
      log.shout("error:$e");
      throw [];
    }
    return categories;
  }
}
