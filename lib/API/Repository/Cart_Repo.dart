import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartRepository {
  Future<CartList> fetchCartList() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}cart'), headers: {
        'Content-Type': 'application/json',
        'Token': jwtToken,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return CartList.fromJson(data);
      } else {
        throw Exception('Failed to load sub category');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch cart list: ${e.toString()}');
    }
  }
}
