// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../Widgets/article_card_large.dart';
// import '../../../../Widgets/article_card_small.dart';
// import '../../../../API/Bloc/Articles/Articles_Bloc.dart';
// import '../../../../API/Bloc/Articles/Articles_State.dart';
// class TrendingArticlesSection extends StatelessWidget {
//   const TrendingArticlesSection();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ArticleBloc, ArticleState>(
//       builder: (context, state) {
//         if (state is ArticleLoading) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is ArticleLoaded) {
//           final articles = state.articles;

//           // Check if there are articles to display
//           if (articles.isEmpty) {
//             return Center(
//               child: Text('No articles found'),
//             );
//           }

//           // Get the first article for the large card
//           final firstArticle = articles[0];

//           // Get the remaining articles for the small cards
//           final remainingArticles = articles.skip(1).toList();

//           return Column(
//             children: [
//               // Display the first article in the large card
//               ArticleCardLarge(
//                 imageUrl: firstArticle.thumbnail,
//                 sourceImageUrl: 'https://via.placeholder.com/24',  // Placeholder for source image
//                 sourceName: firstArticle.articleCategory,
//                 isVerified: true,  // Update this based on actual data
//                 title: firstArticle.title,
//                 date: firstArticle.createdAt.toLocal().toString().substring(0, 10),  // Display date
//               ),

//               // Display remaining articles in small cards
//  ListView.builder(
//   shrinkWrap: true,
//   physics: NeverScrollableScrollPhysics(),
//   itemCount: remainingArticles.length,
//   itemBuilder: (context, index) {
//     final article = remainingArticles[index];
//     return ArticleCardSmall(
//       imageUrl: article.thumbnail,
//       sourceImageUrl: 'https://via.placeholder.com/24',  // Placeholder for source image
//       sourceName: article.articleCategory,
//       isVerified: true,  // Update this based on actual data
//       title: article.title,
//       description: article.text,  // This is now HTML text, but will be truncated
//       date: article.createdAt.toLocal().toString().substring(0, 10),  // Display date
//     );
//   },
// )


//             ],
//           );
//         } else if (state is ArticleError) {
//           return Center(
//             child: Text('Failed to load articles'),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }

import 'package:app/Screens/Parenting/Articles/Articles_Read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Widgets/article_card_large.dart';
import '../../../../Widgets/Article_Card_Small.dart';
import '../../../../API/Bloc/Articles/Articles_Bloc.dart';
import '../../../../API/Bloc/Articles/Articles_State.dart';

class TrendingArticlesSection extends StatelessWidget {
  const TrendingArticlesSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ArticleLoaded) {
          final articles = state.articles;

          // Check if there are articles to display
          if (articles.isEmpty) {
            return const Center(
              child: Text('No articles found'),
            );
          }

          // Get the first article for the large card
          final firstArticle = articles[0];

          // Get the remaining articles for the small cards
          final remainingArticles = articles.skip(1).toList();

          return Column(
            children: [
              // Display the first article in the large card
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailScreen(
                        title: firstArticle.title,
                        content: firstArticle.text,
                        imageUrl: firstArticle.thumbnail,
                        sourceName: firstArticle.articleCategory,
                        date: firstArticle.createdAt
                            .toLocal()
                            .toString()
                            .substring(0, 10),
                        // views: firstArticle.views.toString(),
                        // likes: firstArticle.likes.toString(),
                      ),
                    ),
                  );
                },
                child: ArticleCardLarge(
                  imageUrl: firstArticle.thumbnail,
                  sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                  sourceName: firstArticle.articleCategory,
                  isVerified: true, // Assuming it's true, update based on actual data
                  title: firstArticle.title,
                  date: firstArticle.createdAt.toLocal().toString().substring(0, 10), // Display date
                ),
              ),

              // Display remaining articles in small cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: remainingArticles.length,
                itemBuilder: (context, index) {
                  final article = remainingArticles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            title: article.title,
                            content: article.text,
                            imageUrl: article.thumbnail,
                            sourceName: article.articleCategory,
                            date: article.createdAt.toLocal().toString().substring(0, 10),
                            // views: article.views.toString(),
                            // likes: article.likes.toString(),
                          ),
                        ),
                      );
                    },
                    child: ArticleCardSmall(
                      imageUrl: article.thumbnail,
                      sourceImageUrl: 'https://via.placeholder.com/24', // Placeholder for source image
                      sourceName: article.articleCategory,
                      isVerified: true, // Assuming it's true, update based on actual data
                      title: article.title,
                      description: article.text, // This is now HTML text, but will be truncated
                      date: article.createdAt.toLocal().toString().substring(0, 10), // Display date
                    ),
                  );
                },
              )
            ],
          );
        } else if (state is ArticleError) {
          return const Center(
            child: Text('Failed to load articles'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
