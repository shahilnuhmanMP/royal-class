import 'package:royal_class_app/modules/home/model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> listProducts() async {
    List<Product> categories = [];

    try {
      // Dio dio = Dio();
      print("starting");
      var url = Uri.parse("https://api.escuelajs.co/api/v1/products");

      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      print(response.body);

      print("ending");
      if (response.statusCode == 200) {
        List<dynamic> data = response.body as List<dynamic>;
        categories = data.map((item) => Product.fromJson(item)).toList();
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (error) {
      print('Server Error: $error');
    }
    print(categories);

    return categories;
  }
}
