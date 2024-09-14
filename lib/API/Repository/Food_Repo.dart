import 'package:app/Models/Food/Food.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodRepository {
  Future<FoodDetail> fetchFoodById(int id) async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}food-details/${id}'), headers: {
        'Authorization': jwtToken,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return FoodDetail.fromJson(data);
      } else {
        throw Exception('Failed to load cart list');
      }
    } catch (e) {
      throw Exception('Failed to fetch cart list: ${e.toString()}');
    }
  }
}
