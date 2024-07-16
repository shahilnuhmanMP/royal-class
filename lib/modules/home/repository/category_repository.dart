import 'dart:convert';

import 'package:royal_class_app/modules/home/model/category.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<CategoryModel>> listCategories() async {
    List<CategoryModel> categories = [];

    try {
      var url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        print(jsonResponse);
        categories = jsonResponse as List<CategoryModel>;
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (error) {
      print('Server Error: $error');
    }
    print(categories);
    return categories.isNotEmpty
        ? categories
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList()
        : [];
  }
}
