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



class QuizDetail {
  final int id;
  final String image;
  final String categoryName;
  final String name;
  final int question;
  final int played;
  final int favorite;
  final int points;
  final String? description;
  final List<TopScore> topScore;
  final List<QuizQuestion> quizQuestion;

  QuizDetail({
    required this.id,
    required this.image,
    required this.categoryName,
    required this.name,
    required this.question,
    required this.played,
    required this.favorite,
    required this.points,
    this.description,
    required this.topScore,
    required this.quizQuestion,
  });

  factory QuizDetail.fromJson(Map<String, dynamic> json) {
    return QuizDetail(
      id: json['id'],
      image: json['image'],
      categoryName: json['category_name'],
      name: json['name'],
      question: json['question'],
      played: json['played'],
      favorite: json['favorite'],
      points: json['points'],
      description: json['description'],
      topScore: (json['top_score'] as List<dynamic>)
          .map((e) => TopScore.fromJson(e))
          .toList(),
      quizQuestion: (json['quiz_question'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e))
          .toList(),
    );
  }
}

class TopScore {
  final int childId;
  final String childName;
  final String childImage;
  final int totalQuestions;
  final int correctAnswers;
  final String score;
  final String timeTaken;

  TopScore({
    required this.childId,
    required this.childName,
    required this.childImage,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.score,
    required this.timeTaken,
  });

  factory TopScore.fromJson(Map<String, dynamic> json) {
    return TopScore(
      childId: json['child_id'],
      childName: json['child_name'],
      childImage: json['child_image'],
      totalQuestions: json['total_questions'],
      correctAnswers: json['correct_answers'],
      score: json['score'],
      timeTaken: json['time_taken'],
    );
  }
}

class QuizQuestion {
  final int id;
  final int quizId;
  final String question;
  final int answerId;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Answer> answer;
  final CorrectAnswer correctAnswer;

  QuizQuestion({
    required this.id,
    required this.quizId,
    required this.question,
    required this.answerId,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.answer,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      quizId: json['quiz_id'],
      question: json['question'],
      answerId: json['answer_id'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      answer: (json['answer'] as List<dynamic>)
          .map((e) => Answer.fromJson(e))
          .toList(),
      correctAnswer: CorrectAnswer.fromJson(json['correct_answer']),
    );
  }
}

class Answer {
  final int id;
  final int quizId;
  final String answer;
  final DateTime createdAt;
  final DateTime updatedAt;

  Answer({
    required this.id,
    required this.quizId,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      quizId: json['quiz_id'],
      answer: json['answer'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class CorrectAnswer {
  final int id;
  final int quizId;
  final String answer;
  final DateTime createdAt;
  final DateTime updatedAt;

  CorrectAnswer({
    required this.id,
    required this.quizId,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CorrectAnswer.fromJson(Map<String, dynamic> json) {
    return CorrectAnswer(
      id: json['id'],
      quizId: json['quiz_id'],
      answer: json['answer'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
