import 'package:equatable/equatable.dart';

import '../../../Models/Quiz/quiz.dart';

abstract class QuizBannerEvent {}

class FetchQuizBanners extends QuizBannerEvent {}

abstract class QuizCategoryEvent {}

class FetchQuizCategories extends QuizCategoryEvent {}

abstract class PopularQuizEvent {}

class FetchPopularQuizzes extends PopularQuizEvent {}

abstract class MostRecentQuizEvent {}

class FetchMostRecentQuizzes extends MostRecentQuizEvent {}
abstract class QuizDetailEvent {}

class FetchQuizDetail extends QuizDetailEvent {
  final int quizId;

  FetchQuizDetail(this.quizId);
}
abstract class QuizSubmissionEvent extends Equatable {
  const QuizSubmissionEvent();

  @override
  List<Object> get props => [];
}

class SubmitQuizEvent extends QuizSubmissionEvent {
  final int childId;
  final int quizId;
  final List<AnswerSubmission> answers;

  const SubmitQuizEvent({
    required this.childId,
    required this.quizId,
    required this.answers,
  });

  @override
  List<Object> get props => [childId, quizId, answers];
}
