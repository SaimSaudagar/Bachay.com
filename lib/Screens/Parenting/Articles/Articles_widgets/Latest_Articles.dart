import 'package:app/Screens/Parenting/Articles/articles_read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/widgets/article_card_large.dart';
import 'package:app/widgets/article_card_small.dart';
import '../../../../API/Bloc/Articles/Articles_Bloc.dart';
import '../../../../API/Bloc/Articles/Articles_State.dart';
import 'package:html/parser.dart';  // For HTML parsing

class LatestArticlesSection extends StatelessWidget {
  const LatestArticlesSection({Key? key}) : super(key: key);

  // Helper function to parse and clean up HTML content
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement?.text ?? '';
    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestArticleBloc, LatestArticleState>(
      builder: (context, state) {
        if (state is LatestArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LatestArticleLoaded) {
          final articles = state.articles;

          return Column(
            children: [
              if (articles.isNotEmpty)
                // Display the first article as a large card
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          title: articles[0].title,
                          content: _parseHtmlString(articles[0].text),
                          imageUrl: articles[0].thumbnail,
                          sourceName: articles[0].articleCategory,
                          date: articles[0].createdAt.toLocal().toString().substring(0, 10),
                        ),
                      ),
                    );
                  },
                  child: ArticleCardLarge(
                    imageUrl: articles[0].thumbnail,
                    sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                    sourceName: articles[0].articleCategory,
                    isVerified: true,
                    title: articles[0].title,
                    date: articles[0].createdAt.toLocal().toString().substring(0, 10),
                  ),
                ),
              const SizedBox(height: 24),

              // Display the remaining articles as small cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length - 1, // Start from the second article
                itemBuilder: (context, index) {
                  final article = articles[index + 1];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            title: article.title,
                            content: _parseHtmlString(article.text),
                            imageUrl: article.thumbnail,
                            sourceName: article.articleCategory,
                            date: article.createdAt.toLocal().toString().substring(0, 10),
                          ),
                        ),
                      );
                    },
                    child: ArticleCardSmall(
                      imageUrl: article.thumbnail,
                      sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                      sourceName: article.articleCategory,
                      isVerified: true,
                      title: article.title,
                      description: _parseHtmlString(article.text),  // Clean the HTML content
                      date: article.createdAt.toLocal().toString().substring(0, 10),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is LatestArticleError) {
          return Center(
            child: Text('Failed to load latest articles: ${state.error}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
