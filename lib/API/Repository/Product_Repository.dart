import 'package:app/Models/Products/Single_Product.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Models/Products/Products.dart';

class ProductRepository {
  Future<AllProduct> fetchAllProducts(
      List<String> colors, List<String> ages) async {
    try {
      print("LoadAllProducts");
      String agesQuery =
          ages.isNotEmpty ? ages.map((age) => "'$age'").join(', ') : '';
      String url = '${baseUrl}all_products/?&sizes=[$agesQuery]';
      print("LoadAllProducts with URL: $url");

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("LoadAllProducts with data: $data");
        return AllProduct.fromJson(data);
      } else {
        throw Exception('Failed to all products');
      }
    } catch (e) {
      throw Exception('Failed to fetch all products: ${e.toString()}');
    }
  }

  Future<SingleProduct> fetchSingleproduct(int productId) async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/single/$productId'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SingleProduct.fromJson(data);
      } else {
        throw Exception('Failed to single product');
      }
    } catch (e) {
      throw Exception('Failed to fetch single product: ${e.toString()}');
    }
  }

  Future<String> addToCart(int productId, int quantity) async {
    try {
      final response = await http.post(Uri.parse('${baseUrl}cart/add'),
          body: {'id': productId.toString(), 'quantity': quantity.toString()},
          headers: {'Authorization': jwtToken});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else {
        throw Exception('Failed to add to cart');
      }
    } catch (e) {
      throw Exception('Failed to add to cart: ${e.toString()}');
    }
  }

  Future<String> realatedProducts(int productID) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}products/related-products/${productID}'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else {
        throw Exception('Failed to add to cart');
      }
    } catch (e) {
      throw Exception('Failed to add to cart: ${e.toString()}');
    }
  }
}
