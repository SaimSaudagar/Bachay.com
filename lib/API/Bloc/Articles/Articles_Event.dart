import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticles extends ArticleEvent {}
abstract class LatestArticleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchLatestArticles extends LatestArticleEvent {}
abstract class ArticleCategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchArticleCategories extends ArticleCategoryEvent {}
abstract class ArticleByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchArticlesByCategory extends ArticleByCategoryEvent {
  final int categoryId;

  FetchArticlesByCategory({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}