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
