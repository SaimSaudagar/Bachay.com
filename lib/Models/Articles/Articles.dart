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
class ArticleCategory {
  final int id;
  final String name;
  final String tagLine;
  final String image;

  ArticleCategory({
    required this.id,
    required this.name,
    required this.tagLine,
    required this.image,
  });

  factory ArticleCategory.fromJson(Map<String, dynamic> json) {
    return ArticleCategory(
      id: json['id'],
      name: json['name'],
      tagLine: json['tag_line'],
      image: json['image'],
    );
  }
}
class ArticleByCategory {
  final int id;
  final String title;
  final String thumbnail;
  final String text;
  final String date;
  final String sourceImageUrl;
  final String sourceName;

  ArticleByCategory({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.text,
    required this.date,
    required this.sourceImageUrl,
    required this.sourceName,
  });

  factory ArticleByCategory.fromJson(Map<String, dynamic> json) {
    return ArticleByCategory(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      text: json['text'],
      date: json['created_at'],
      sourceImageUrl: json['articlecategory']['image'],
      sourceName: json['articlecategory']['name'],
    );
  }
}
