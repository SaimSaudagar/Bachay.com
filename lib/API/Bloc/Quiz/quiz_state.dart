import 'package:equatable/equatable.dart';

import '../../../Models/Quiz/quiz.dart';

abstract class QuizBannerState {}

class QuizBannerInitial extends QuizBannerState {}

class QuizBannerLoading extends QuizBannerState {}

class QuizBannerLoaded extends QuizBannerState {
  final List<QuizBanner> quizBanners;

  QuizBannerLoaded(this.quizBanners);
}

class QuizBannerError extends QuizBannerState {
  final String message;

  QuizBannerError(this.message);
}

abstract class QuizCategoryState {}

class QuizCategoryInitial extends QuizCategoryState {}

class QuizCategoryLoading extends QuizCategoryState {}

class QuizCategoryLoaded extends QuizCategoryState {
  final List<QuizCategory> quizCategories;

  QuizCategoryLoaded(this.quizCategories);
}

class QuizCategoryError extends QuizCategoryState {
  final String message;

  QuizCategoryError(this.message);
}

abstract class PopularQuizState {}

class PopularQuizInitial extends PopularQuizState {}

class PopularQuizLoading extends PopularQuizState {}

class PopularQuizLoaded extends PopularQuizState {
  final List<PopularQuiz> popularQuizzes;

  PopularQuizLoaded(this.popularQuizzes);
}

class PopularQuizError extends PopularQuizState {
  final String message;

  PopularQuizError(this.message);
}

abstract class MostRecentQuizState {}

class MostRecentQuizInitial extends MostRecentQuizState {}

class MostRecentQuizLoading extends MostRecentQuizState {}

class MostRecentQuizLoaded extends MostRecentQuizState {
  final List<MostRecentQuiz> mostRecentQuizzes;

  MostRecentQuizLoaded(this.mostRecentQuizzes);
}

class MostRecentQuizError extends MostRecentQuizState {
  final String message;

  MostRecentQuizError(this.message);
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
abstract class QuizSubmissionState extends Equatable {
  const QuizSubmissionState();

  @override
  List<Object> get props => [];
}

class QuizSubmissionInitial extends QuizSubmissionState {}

class QuizSubmissionLoading extends QuizSubmissionState {}

class QuizSubmissionSuccess extends QuizSubmissionState {}

class QuizSubmissionFailure extends QuizSubmissionState {
  final String error;

  const QuizSubmissionFailure(this.error);

  @override
  List<Object> get props => [error];
}