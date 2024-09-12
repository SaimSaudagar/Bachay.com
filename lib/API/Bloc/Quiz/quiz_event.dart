abstract class QuizBannerEvent {}

class FetchQuizBanners extends QuizBannerEvent {}
abstract class QuizCategoryEvent {}

class FetchQuizCategories extends QuizCategoryEvent {}
abstract class PopularQuizEvent {}

class FetchPopularQuizzes extends PopularQuizEvent {}
abstract class MostRecentQuizEvent {}

class FetchMostRecentQuizzes extends MostRecentQuizEvent {}
