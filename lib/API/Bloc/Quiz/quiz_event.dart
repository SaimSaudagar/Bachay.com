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
abstract class QuizDetailState {}

class QuizDetailInitial extends QuizDetailState {}

class QuizDetailLoading extends QuizDetailState {}

class QuizDetailLoaded extends QuizDetailState {
  final QuizDetail quizDetail;

  QuizDetailLoaded(this.quizDetail);
}

class QuizDetailError extends QuizDetailState {
  final String message;

  QuizDetailError(this.message);
}