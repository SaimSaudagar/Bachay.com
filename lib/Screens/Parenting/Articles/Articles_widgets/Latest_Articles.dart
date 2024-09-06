import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/widgets/article_card_large.dart';
import 'package:app/widgets/article_card_small.dart';
import '../../../../API/Bloc/Articles/Articles_Bloc.dart';
import '../../../../API/Bloc/Articles/Articles_State.dart';
class LatestArticlesSection extends StatelessWidget {
  const LatestArticlesSection({Key? key}) : super(key: key);

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
                ArticleCardLarge(
                  imageUrl: articles[0].thumbnail,
                  sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                  sourceName: articles[0].articleCategory,
                  isVerified: true,
                  title: articles[0].title,
                  date: articles[0].createdAt.toLocal().toString().substring(0, 10),
                ),
              const SizedBox(height: 24),
              // Display the remaining articles as small cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length - 1, // Start from the second article
                itemBuilder: (context, index) {
                  final article = articles[index + 1];
                  return ArticleCardSmall(
                    imageUrl: article.thumbnail,
                    sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                    sourceName: article.articleCategory,
                    isVerified: true,
                    title: article.title,
                    description: article.text,
                    date: article.createdAt.toLocal().toString().substring(0, 10),
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
