import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartRepository {
  // Future<String> addToCart(String id, String quantity) async {
  //   try {
  //     final response = await http.post(Uri.parse('${baseUrl}cart/add'), body: {
  //       'id': id,
  //       'quantity': quantity,
  //     }, headers: {
  //       'Authorization': jwtToken,
  //     });

  //     var jsonResponse = jsonDecode(response.body);

  //     if (jsonResponse['status'] == 1) {
  //       return jsonResponse['message'];
  //     } else {
  //       throw Exception('Failed to add item $id to cart');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to add item $id: ${e.toString()}');
  //   }
  // }

  Future<CartItemList> fetchCartList() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}cart'), headers: {
        'Authorization': jwtToken,
      });

      if (response.body.split(",")[1] != "401]") {
        final data = jsonDecode(response.body);
        // print(data);
        return CartItemList.fromJson(data);
      } else {
        throw Exception('Failed to load cart list');
      }
    } catch (e) {
      throw Exception('Failed to fetch cart list: ${e.toString()}');
    }
  }

  Future<String> updateCart(int key, int quantity) async {
    try {
      final response =
          await http.post(Uri.parse('${baseUrl}cart/update'), body: {
        'key': key.toString(),
        'quantity': quantity.toString(),
      }, headers: {
        'Authorization': jwtToken,
      });

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 1) {
        return "Cart Updated";
      } else {
        throw Exception('Failed to update cart');
      }
    } catch (e) {
      throw Exception('Failed to update cart: ${e.toString()}');
    }
  }

  Future<String> deleteCartItem(String key) async {
    try {
      final response =
          await http.post(Uri.parse('${baseUrl}cart/remove'), body: {
        'key': key.toString(),
      }, headers: {
        'Authorization': jwtToken,
      });

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to delete cart item $key');
      }
    } catch (e) {
      throw Exception('Failed to delete cart item $key: ${e.toString()}');
    }
  }

  Future<String> deleteCart() async {
    try {
      final response =
          await http.post(Uri.parse('${baseUrl}cart/remove-all'), headers: {
        'Authorization': jwtToken,
      });

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to delete cart');
      }
    } catch (e) {
      throw Exception('Failed to delete cart ${e.toString()}');
    }
  }
}
