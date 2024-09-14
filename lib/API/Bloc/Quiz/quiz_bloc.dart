import 'package:flutter_bloc/flutter_bloc.dart';
import 'quiz_state.dart';
import '../../Repository/Quiz_Repo.dart';
import 'quiz_event.dart';

class QuizBannerBloc extends Bloc<QuizBannerEvent, QuizBannerState> {
  final QuizBannerRepository quizBannerRepository;

  QuizBannerBloc(this.quizBannerRepository) : super(QuizBannerInitial()) {
    // Register event handler for FetchQuizBanners
    on<FetchQuizBanners>((event, emit) async {
      emit(QuizBannerLoading());
      try {
        final banners = await quizBannerRepository.fetchQuizBanners();
        emit(QuizBannerLoaded(banners));
      } catch (e) {
        print("Error: $e");
        emit(QuizBannerError(e.toString()));
      }
    });
  }
}

class QuizCategoryBloc extends Bloc<QuizCategoryEvent, QuizCategoryState> {
  final QuizCategoryRepository quizCategoryRepository;

  QuizCategoryBloc(this.quizCategoryRepository) : super(QuizCategoryInitial()) {
    on<FetchQuizCategories>((event, emit) async {
      emit(QuizCategoryLoading());
      try {
        final categories = await quizCategoryRepository.fetchQuizCategories();
        emit(QuizCategoryLoaded(categories));
      } catch (e) {
        emit(QuizCategoryError(e.toString()));
      }
    });
  }
}

class PopularQuizBloc extends Bloc<PopularQuizEvent, PopularQuizState> {
  final PopularQuizRepository popularQuizRepository;

  PopularQuizBloc(this.popularQuizRepository) : super(PopularQuizInitial()) {
    on<FetchPopularQuizzes>((event, emit) async {
      emit(PopularQuizLoading());
      try {
        final quizzes = await popularQuizRepository.fetchPopularQuizzes();
        emit(PopularQuizLoaded(quizzes));
      } catch (e) {
        emit(PopularQuizError(e.toString()));
      }
    });
  }
}

class MostRecentQuizBloc
    extends Bloc<MostRecentQuizEvent, MostRecentQuizState> {
  final MostRecentQuizRepository mostRecentQuizRepository;

  MostRecentQuizBloc(this.mostRecentQuizRepository)
      : super(MostRecentQuizInitial()) {
    on<FetchMostRecentQuizzes>((event, emit) async {
      emit(MostRecentQuizLoading());
      try {
        final quizzes = await mostRecentQuizRepository.fetchMostRecentQuizzes();
        emit(MostRecentQuizLoaded(quizzes));
      } catch (e) {
        emit(MostRecentQuizError(e.toString()));
      }
    });
  }
}

class SingleQuizBloc extends Bloc<SingleQuizEvent, SingleQuizState> {
  final SingleQuizRepository singleQuizRepository;

  SingleQuizBloc(this.singleQuizRepository) : super(SingleQuizInitial()) {
    on<FetchSingleQuiz>((event, emit) async {
      emit(SingleQuizLoading());
      try {
        final quiz = await singleQuizRepository.fetchQuiz(event.id);
        emit(SingleQuizLoaded(quiz));
      } catch (e) {
        print(e.toString());
        emit(SingleQuizError(e.toString()));
      }
    });
  }
}
