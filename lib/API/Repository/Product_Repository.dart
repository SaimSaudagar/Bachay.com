import 'package:app/Models/Products/Single_Product.dart';
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

  Future<SingleProduct> fetchSingleproduct(int productId) async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/single/$productId'));
      print(response.body);
      print(productId);
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

  Future<int> addToCart(int productId, int quantity) async {
    print("CHECK");
    try {
      final response = await http.post(Uri.parse('${baseUrl}cart/add'),
          body: jsonEncode({'id': productId, 'quantity': quantity}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjYxMmEzMDVlYzlhZTQ5NjE4NzM0ZGMyZjVmMjdiNTY1MTJkMmI2ZWRhNWYxYTNmZTkxYjBhZWVjYjFkZjAwZDJhZmJmMDM4NWFjZmU0MDUiLCJpYXQiOjE3MTk0NzI4MzEuMTA4Nzg2LCJuYmYiOjE3MTk0NzI4MzEuMTA4Nzg4LCJleHAiOjE3MzUyODQwMzEuMTAxMzkyLCJzdWIiOiIyMCIsInNjb3BlcyI6W119.glMpr_q9RBK8OY-1Ut98KDdFJFJXI2-QKBiBYvKUC9ENpGc_ViN65xkAYlfpuNKHy4uFeNvLJd1xIaCO4LfQEXtLL9ayeQ8UDoH5NBGfzJlz5pububZpClZsjFnnmLC-QiJ3Wq9yeD0Sw4Yrl4Yn94cI2Tg8ad-FMXnBM2EMU5vgftj18IdK7Y1xk6lSWfXGooNfVO32GrHO6Tn8S5wcvJDcdDZQWpQX5xumrjvN42CitxWJhKPRdYWEw-hXfjGAADOb5fnm69e2u4nWkTSjvLJ9HJy8DVYEwwUPWzJ0W-qhu4HM8V8bc3toFltJk9uKtxZcFpWw-hynZAkUdb011NgOkQKRdyDeAMHqW8gFfhXQj1uoiiXLpCPr9kYyvhY8pimHNe0-h2SuXzf4T-Qza8XIiIaz1s6ITx1HPtkB_nlD5wzmFgo3BvV0LueWxjQ0wA5O0oU6UWEwWVkFS-47HRjTLDPvx9ul53JUXw2y1xaZbBlVnlknjnc_JWszMbk-C6jCWwn9J_fxMAhIF-hUO-AYHTvJ_MBC4W6u8xyN7gA_7Wn2haS_B42dirou3uYlBV8B-C9du46EOK5A898mkrycFXfjG93LgcoWOxlbqBNxg_Yyr5ftOTXxLqjsMynHMTXjmAx8Y7yevg5OfpVvv3uVrE0_LBhT91pitJQKq58'
          });
      print(response.body);
      print(productId);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['status'];
      } else {
        print("HEREEE");
        throw Exception('Failed to add to cart');
      }
    } catch (e) {
      throw Exception('Failed to add to cart: ${e.toString()}');
    }
  }
}
