import 'dart:convert';
import 'package:app/Models/Category/Category_Banner.dart';
import 'package:app/Models/Category/Sub_Category.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<CategoryBannerList> fetchCategoryBanner(int categoryId) async {
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}categories/banners/${categoryId}/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CategoryBannerList.fromJson(data);
      } else {
        throw Exception('Failed to load category banner');
      }
    } catch (e) {
      throw Exception('Failed to fetch category banner: ${e.toString()}');
    }
  }

  Future<SubCategoryList> fetchSubCategory(int categoryId) async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}categories/sub-categories/1'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SubCategoryList.fromJson(data);
      } else {
        throw Exception('Failed to load sub category');
      }
    } catch (e) {
      throw Exception('Failed to fetch sub category: ${e.toString()}');
    }
  }
}
