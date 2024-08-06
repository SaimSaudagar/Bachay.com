import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Models/Order/Order_Item.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderRepository {
  Future<String> placeOrder() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}customer/order/place'), headers: {
        'Authorization': jwtToken,
      });

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        return responseBody['order_ids'];
      } else {
        throw Exception('Failed to place order');
      }
    } catch (e) {
      throw Exception('Failed to place order ${e.toString()}');
    }
  }

  Future<OrderList> fetchOrderList(String id) async {
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}customer/order/details?order_id=$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return OrderList.fromJson(data);
      } else {
        throw Exception('Failed to order list');
      }
    } catch (e) {
      throw Exception('Failed to fetch order list: ${e.toString()}');
    }
  }
}
