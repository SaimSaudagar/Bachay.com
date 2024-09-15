import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/Articles/Articles.dart';

class ArticleRepository {
  final String apiUrl = 'https://bachay.com/api/v1/article/trending';

  Future<List<TrendingArticle>> fetchTrendingArticles() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['articles'];
      return jsonData.map((data) => TrendingArticle.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load trending articles');
    }
  }
}


class LatestArticlesRepository {
  final String apiUrl = 'https://bachay.com/api/v1/article/latest';

  Future<List<LatestArticle>> fetchLatestArticles() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> articlesJson = data['articles'];
        List<LatestArticle> articles = articlesJson.map((json) => LatestArticle.fromJson(json)).toList();
        return articles;
      } else {
        throw Exception('Failed to load latest articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch latest articles: $e');
    }
  }
}
class ArticleCategoryRepository {
  final String apiUrl = 'https://bachay.com/api/v1/article/categories';

  Future<List<ArticleCategory>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<ArticleCategory> categories = (data['categories'] as List)
          .map((category) => ArticleCategory.fromJson(category))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
class ArticleByCategoryRepository {
  Future<List<ArticleByCategory>> fetchArticlesByCategory(int categoryId) async {
    final response = await http.get(
      Uri.parse('https://bachay.com/api/v1/article/category/$categoryId'),
    );
   print("API Response Code: ${response.statusCode}"); // Log the status code
    print("API Response Body: ${response.body}");
   
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<ArticleByCategory> articles = (data['articles'] as List)
          .map((article) => ArticleByCategory.fromJson(article))
          .toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}