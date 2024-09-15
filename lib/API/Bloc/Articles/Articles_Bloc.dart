import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Models/Articles/Articles.dart';
import '../../Repository/Articles_Repo.dart';
import 'Articles_Event.dart';
import 'Articles_State.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc(this.articleRepository) : super(ArticleInitial()) {
    on<FetchArticles>((event, emit) async {
      emit(ArticleLoading());

      try {
        final articles = await articleRepository.fetchTrendingArticles();
        emit(ArticleLoaded(articles));
      } catch (e) {
        emit(ArticleError('Failed to fetch articles.'));
      }
    });
  }
}
class LatestArticleBloc extends Bloc<LatestArticleEvent, LatestArticleState> {
  final LatestArticlesRepository latestArticlesRepository;

  LatestArticleBloc(this.latestArticlesRepository) : super(LatestArticleInitial()) {
    // Registering the event handler for FetchLatestArticles
    on<FetchLatestArticles>(_onFetchLatestArticles);
  }

  // Event handler for FetchLatestArticles
  Future<void> _onFetchLatestArticles(
      FetchLatestArticles event, Emitter<LatestArticleState> emit) async {
    emit(LatestArticleLoading());
    try {
      List<LatestArticle> articles = await latestArticlesRepository.fetchLatestArticles();
      emit(LatestArticleLoaded(articles));
    } catch (e) {
      emit(LatestArticleError(e.toString()));
    }
  }
}
class ArticleCategoryBloc extends Bloc<ArticleCategoryEvent, ArticleCategoryState> {
  final ArticleCategoryRepository repository;

  ArticleCategoryBloc({required this.repository}) : super(ArticleCategoryInitial()) {
    on<FetchArticleCategories>((event, emit) async {
      try {
        emit(ArticleCategoryLoading());
        final categories = await repository.fetchCategories();
        emit(ArticleCategoryLoaded(categories: categories));
      } catch (e) {
        emit(ArticleCategoryError(message: e.toString()));
      }
    });
  }
}
class ArticleByCategoryBloc extends Bloc<ArticleByCategoryEvent, ArticleByCategoryState> {
  final ArticleByCategoryRepository repository;

  ArticleByCategoryBloc({required this.repository}) : super(ArticleByCategoryInitial()) {
    on<FetchArticlesByCategory>((event, emit) async {
      try {
        emit(ArticleByCategoryLoading());
        final articles = await repository.fetchArticlesByCategory(event.categoryId);
        emit(ArticleByCategoryLoaded(articles: articles));
      } catch (e) {
        emit(ArticleByCategoryError(message: e.toString()));
      }
    });
  }
}