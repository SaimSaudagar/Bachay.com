import 'package:equatable/equatable.dart';
import '../../../Models/Articles/Articles.dart';

// Abstract State class
abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<TrendingArticle> articles;

  const ArticleLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError(this.message);

  @override
  List<Object> get props => [message];
}
abstract class LatestArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LatestArticleInitial extends LatestArticleState {}

class LatestArticleLoading extends LatestArticleState {}

class LatestArticleLoaded extends LatestArticleState {
  final List<LatestArticle> articles;

  LatestArticleLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class LatestArticleError extends LatestArticleState {
  final String error;

  LatestArticleError(this.error);

  @override
  List<Object?> get props => [error];
}