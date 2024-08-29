import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Models/Child/Child.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChildRepository {
  Future<ChildrenList> fetchChildren() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}childerens'), headers: {
        'Authorization': jwtToken,
      });

      if (response.body.split(",")[1] != "401]") {
        final data = jsonDecode(response.body);
        // print(data);
        return ChildrenList.fromJson(data);
      } else {
        throw Exception('Failed to load cart list');
      }
    } catch (e) {
      throw Exception('Failed to fetch cart list: ${e.toString()}');
    }
  }
}
