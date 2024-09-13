import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/Utils/app_constants.dart';
import '../../../Models/Quiz/Quiz.dart'; // Import the app_constants.dart

class QuizBannerRepository {
  final String apiUrl =
      "${baseUrl}quiz/banner"; // Using baseUrl from app_constants.dart

  Future<List<QuizBanner>> fetchQuizBanners() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken, // Use the imported jwtToken here
      },
    );
    print("API Response Code: ${response.statusCode}"); // Log the status code
    print("API Response Body: ${response.body}"); // Log the response body
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> bannerList = data['quiz_banner'];
      return bannerList.map((json) => QuizBanner.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load banners");
    }
  }
}

class CategoryRepository {
  final String apiUrl = "${baseUrl}quiz/categories";

  Future<List<QuizCategory>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken, // Use the imported jwtToken here
      },
    );
    print("API Response Code: ${response.statusCode}"); // Log the status code
    print("API Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => QuizCategory.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }
}

class QuizCategoryRepository {
  final String apiUrl = "${baseUrl}quiz/categories";

  Future<List<QuizCategory>> fetchQuizCategories() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken, // Use the imported jwtToken here
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => QuizCategory.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load quiz categories");
    }
  }
}

class PopularQuizRepository {
  final String apiUrl = "${baseUrl}quiz/popular";

  Future<List<PopularQuiz>> fetchPopularQuizzes() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken, // Use the imported jwtToken here
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PopularQuiz.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load popular quizzes");
    }
  }
}

class MostRecentQuizRepository {
  final String apiUrl = "${baseUrl}quiz/most-recent";

  Future<List<MostRecentQuiz>> fetchMostRecentQuizzes() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MostRecentQuiz.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load most recent quizzes");
    }
  }
}
