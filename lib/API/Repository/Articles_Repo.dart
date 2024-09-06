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
