import 'package:app/Screens/Parenting/Articles/articles_read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import the intl package
import '../../../API/Bloc/Articles/Articles_Bloc.dart';
import '../../../API/Bloc/Articles/Articles_Event.dart';
import '../../../API/Bloc/Articles/Articles_State.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/article_card_large.dart';
import '../../../Widgets/article_card_small.dart';
import 'Articles_widgets/Latest_Articles.dart';
import 'Articles_widgets/Trending_Articles.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen>
    with TickerProviderStateMixin {
  TabController? _appBarTabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleCategoryBloc>(context).add(FetchArticleCategories());
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleCategoryBloc, ArticleCategoryState>(
        builder: (context, state) {
          if (state is ArticleCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleCategoryLoaded) {
            _appBarTabController = TabController(
              length: state.categories.length,
              vsync: this,
            );
            BlocProvider.of<ArticleByCategoryBloc>(context).add(
                FetchArticlesByCategory(categoryId: state.categories[0].id));

            return Column(
              children: [
                // Tab Bar with dynamic categories
                TabBar(
                  controller: _appBarTabController,
                  isScrollable: true,
                  labelColor: Colors.pinkAccent,
                  unselectedLabelColor: Colors.black,
                  indicator: const BoxDecoration(),
                  onTap: (index) {
                    // Fetch articles for the selected category
                    final categoryId = state.categories[index].id;
                    BlocProvider.of<ArticleByCategoryBloc>(context)
                        .add(FetchArticlesByCategory(categoryId: categoryId));
                  },
                  tabs: state.categories.map((category) {
                    return _buildAppBarTab(category.name, context);
                  }).toList(),
                ),
                // Articles Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: getPadding(context)),
                      child: Column(
                        children: [
                          BlocBuilder<ArticleByCategoryBloc,
                              ArticleByCategoryState>(
                            builder: (context, articleState) {
                              if (articleState is ArticleByCategoryLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (articleState
                                  is ArticleByCategoryLoaded) {
                                if (articleState.articles.isEmpty) {
                                  return const Center(
                                      child: Text('No articles found'));
                                }
                                final firstArticle = articleState.articles[0];

                                return Column(
                                  children: [
                                    // Display the first article in ArticleCardLarge
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ArticleDetailScreen(
                                              title: firstArticle.title,
                                              content: firstArticle.text,
                                              imageUrl: firstArticle.thumbnail,
                                              sourceName:
                                                  firstArticle.sourceName,
                                              date: _formatDate(firstArticle
                                                  .date), // Format the date here
                                            ),
                                          ),
                                        );
                                      },
                                      child: ArticleCardLarge(
                                        imageUrl: firstArticle.thumbnail,
                                        sourceImageUrl:
                                            firstArticle.sourceImageUrl,
                                        sourceName: firstArticle.sourceName,
                                        title: firstArticle.title,
                                        date: _formatDate(firstArticle
                                            .date), // Format the date here
                                      ),
                                    ),
                                    // Display the rest in ArticleCardSmall
                                    ...articleState.articles.skip(1).map(
                                      (article) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ArticleDetailScreen(
                                                  title: article.title,
                                                  content: article.text,
                                                  imageUrl: article.thumbnail,
                                                  sourceName:
                                                      article.sourceName,
                                                  date: _formatDate(article
                                                      .date), // Format the date here
                                                ),
                                              ),
                                            );
                                          },
                                          child: ArticleCardSmall(
                                            imageUrl: article.thumbnail,
                                            sourceImageUrl:
                                                article.sourceImageUrl,
                                            sourceName: article.sourceName,
                                            title: article.title,
                                            description: article.text,
                                            date: _formatDate(article
                                                .date), // Format the date here
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ],
                                );
                              } else if (articleState
                                  is ArticleByCategoryError) {
                                return Center(
                                    child:
                                        Text('Error: ${articleState.message}'));
                              }
                              return const Center();
                            },
                          ),
                          // Trending Articles Section
                          const SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getPadding(context)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getBigFontSize(context) * 1.5,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                          const TrendingArticlesSection(),
                          // Latest Articles Section
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getPadding(context)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Latest',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getBigFontSize(context) * 1.5,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                          const LatestArticlesSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ArticleCategoryError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const Center(child: Text('No categories available'));
        },
      ),
    );
  }

  // Method to format the date in 'Month Day, Year' format
  String _formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('MMMM dd, yyyy').format(parsedDate);
  }

  // Method to build each app bar tab with rounded rectangular border
  Widget _buildAppBarTab(String text, BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getPadding(context), vertical: getPadding(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.pinkAccent, width: 1),
        ),
        child: Text(
          text,
          style: outfitRegular.copyWith(fontSize: getFontSize(context)),
        ),
      ),
    );
  }
}
