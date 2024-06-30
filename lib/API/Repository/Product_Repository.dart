import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Models/Products/Products.dart';

class ProductRepository {
  Future<AllProduct> fetchAllProducts() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}all_products/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AllProduct.fromJson(data);
      } else {
        throw Exception('Failed to all products');
      }
    } catch (e) {
      throw Exception('Failed to fetch all products: ${e.toString()}');
    }
  }
}
