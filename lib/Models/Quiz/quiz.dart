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

class QuizList {
  final List<Quiz> quizzes;

  QuizList({required this.quizzes});

  factory QuizList.fromJson(List<dynamic> jsonList) {
    List<Quiz> quizzes = jsonList.map((quizJson) {
      return Quiz.fromJson(quizJson);
    }).toList();

    return QuizList(quizzes: quizzes);
  }
}

class Quiz {
  final int id;
  final String question;
  final List<Answer> answers;
  final Answer correctAnswer;

  Quiz({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    // Accessing the correct keys from JSON
    return Quiz(
      id: json['id'],
      question: json['question'],
      answers: List<Answer>.from(
          json['answer'].map((x) => Answer.fromJson(x))), // FIX THIS LINE
      correctAnswer: Answer.fromJson(json['correct_answer']),
    );
  }
}

class Answer {
  final int id;
  final String answer;

  Answer({
    required this.id,
    required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      answer: json['answer'],
    );
  }
}
