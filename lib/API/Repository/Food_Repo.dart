import 'package:app/Models/Food/Food.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Bloc/Food/Food_Bloc.dart';

class FoodCategoryRepository {
  final String baseUrl = 'https://bachay.com/api/v1/food-categories';

  Future<List<FoodCategory>> fetchFoodCategories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body)['categories'];
      return categoriesJson
          .map((categoryJson) => FoodCategory.fromJson(categoryJson))
          .toList();
    } else {
      throw Exception('Failed to load food categories');
    }
  }
}
class FoodRepository {
  final String baseUrl = 'https://bachay.com/api/v1/food-categories';

  Future<List<Food>> fetchFoodsByCategory(int categoryId) async {
    // Assuming '0' is used to fetch all foods
    final url = categoryId == 0 ? '$baseUrl/all' : '$baseUrl/$categoryId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> foodsJson = json.decode(response.body)['foods'];
      return foodsJson.map((foodJson) => Food.fromJson(foodJson)).toList();
    } else {
      throw Exception('Failed to load foods for category $categoryId');
    }
  }
}
class AllFoodRepository {
  final String allFoodEndpoint = 'https://bachay.com/api/v1/food-details';

  Future<List<Food>> fetchAllFoods() async {
    final response = await http.get(Uri.parse(allFoodEndpoint));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Food> foods = (data['foods'] as List)
          .map((foodJson) => Food.fromJson(foodJson))
          .toList();
      return foods;
    } else {
      throw Exception('Failed to load all foods');
    }
  }
}