import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/Utils/app_constants.dart';
import '../../../Models/Quiz/quiz.dart'; // Import the app_constants.dart

class QuizBannerRepository {
  final String apiUrl =
      "${baseUrl}quiz/banner"; // Using baseUrl from app_constants.dart

  Future<List<QuizBanner>> fetchQuizBanners() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            jwtToken, // Use the imported jwtToken here
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
        'Authorization':
            jwtToken, // Use the imported jwtToken here
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
        'Authorization':
            jwtToken, // Use the imported jwtToken here
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
        'Authorization': jwtToken,
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

class QuizDetailRepository {
  Future<QuizDetail> fetchQuizDetail(int id) async {
    final String apiUrl = "${baseUrl}quiz/view/$id";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': jwtToken, // Ensure jwtToken is defined
      },
    );

    print("API Response Code: ${response.statusCode}");
    print("API Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return QuizDetail.fromJson(data);
    } else {
      throw Exception("Failed to load quiz details");
    }
  }

  /// Submits all quiz answers at once
  Future<void> submitQuizAnswers({
  required int childId,
  required int quizId,
  required List<AnswerSubmission> answers,
}) async {
  final String apiUrl = "${baseUrl}quiz/submission";
  final Map<String, dynamic> payload = {
    'child_id': childId,
    'quiz_id': quizId,
    'answers': answers.map((answer) => answer.toJson()).toList(),
  };

  print("Submission Payload: ${jsonEncode(payload)}"); // Log the payload

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': jwtToken, // Corrected Authorization header
    },
    body: jsonEncode(payload), // Use the defined payload
  );

  print("Submission API Response Code: ${response.statusCode}");
  print("Submission API Response Body: ${response.body}");

  if (response.statusCode == 200) {
    // Successful submission
    return;
  } else if (response.statusCode == 400) {
    // Bad Request
    final errorData = json.decode(response.body);
    throw Exception(errorData['errors'] ?? 'Bad Request');
  } else if (response.statusCode == 403) {
    // Forbidden
    throw Exception('Access denied. Please check your credentials.');
  } else {
    // Other errors
    throw Exception('Failed to submit quiz answers. Status Code: ${response.statusCode}');
  }
}
}