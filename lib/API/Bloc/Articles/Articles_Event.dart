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