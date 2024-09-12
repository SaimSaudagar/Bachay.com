class QuizBanner {
  final int id;
  final String image;

  QuizBanner({required this.id, required this.image});

  factory QuizBanner.fromJson(Map<String, dynamic> json) {
    return QuizBanner(
      id: json['id'],
      image: json['image'],
    );
  }
}
class QuizCategory {
  final int id;
  final String name;
  final String image;
  final String expiry;
  final DateTime createdAt;
  final DateTime updatedAt;

  QuizCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.expiry,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QuizCategory.fromJson(Map<String, dynamic> json) {
    return QuizCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      expiry: json['expiry'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
class PopularQuiz {
  final int id;
  final int quizCategoryId;
  final String name;
  final String image;
  final String expiryDate;

  PopularQuiz({
    required this.id,
    required this.quizCategoryId,
    required this.name,
    required this.image,
    required this.expiryDate,
  });

  factory PopularQuiz.fromJson(Map<String, dynamic> json) {
    return PopularQuiz(
      id: json['id'],
      quizCategoryId: json['quiz_category_id'],
      name: json['name'],
      image: json['image'],
      expiryDate: json['expiry_date'],
    );
  }
}
class MostRecentQuiz {
  final int id;
  final int quizCategoryId;
  final String name;
  final String image;
  final String expiryDate;

  MostRecentQuiz({
    required this.id,
    required this.quizCategoryId,
    required this.name,
    required this.image,
    required this.expiryDate,
  });

  factory MostRecentQuiz.fromJson(Map<String, dynamic> json) {
    return MostRecentQuiz(
      id: json['id'],
      quizCategoryId: json['quiz_category_id'],
      name: json['name'],
      image: json['image'],
      expiryDate: json['expiry_date'],
    );
  }
}
