class TrendingArticle {
  final int id;
  final String title;
  final String thumbnail;
  final int articleCategoryId;
  final String articleCategory;
  final DateTime createdAt;
  final String text;

  TrendingArticle({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.articleCategoryId,
    required this.articleCategory,
    required this.createdAt,
    required this.text,
  });

  // Factory method to create an instance from JSON
  factory TrendingArticle.fromJson(Map<String, dynamic> json) {
    return TrendingArticle(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      articleCategoryId: json['article_category_id'],
      articleCategory: json['article_category'],
      createdAt: DateTime.parse(json['created_at']),
      text: json['text'],
    );
  }
}

class LatestArticle {
  final int id;
  final String title;
  final String thumbnail;
  final int articleCategoryId;
  final String articleCategory;
  final DateTime createdAt;
  final String text;

  LatestArticle({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.articleCategoryId,
    required this.articleCategory,
    required this.createdAt,
    required this.text,
  });

  factory LatestArticle.fromJson(Map<String, dynamic> json) {
    return LatestArticle(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      articleCategoryId: json['article_category_id'],
      articleCategory: json['article_category'],
      createdAt: DateTime.parse(json['created_at']),
      text: json['text'],
    );
  }
}
