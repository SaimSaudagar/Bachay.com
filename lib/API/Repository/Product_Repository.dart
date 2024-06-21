import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Models/Products/Products.dart';

// class ProductRepository {
//   Future<ProductResponse> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://bachay.com/api/v1/all_products/'));

//     if (response.statusCode == 200) {
//       return ProductResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }


class ProductRepository {
  Future<ProductResponse> fetchProducts() async {
    final response = await http.get(Uri.parse('https://bachay.com/api/v1/all_products/'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
