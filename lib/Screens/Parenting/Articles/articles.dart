import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/API/Bloc/Articles/Articles_Bloc.dart';
import 'package:app/API/Bloc/Articles/Articles_Event.dart';
import 'package:app/API/Repository/Articles_Repo.dart';
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
    _appBarTabController = TabController(length: 5, vsync: this);
    _appBarTabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar Tabs with Rounded Rectangular Borders
          TabBar(
            controller: _appBarTabController,
            isScrollable: true,
            labelColor: Colors.pinkAccent,
            unselectedLabelColor: Colors.black,
            indicator: const BoxDecoration(),
            tabs: [
              _buildAppBarTab("Read"),
              _buildAppBarTab("Video"),
              _buildAppBarTab("Popular"),
              _buildAppBarTab("Latest"),
              _buildAppBarTab("Saved"),
            ],
          ),
          // Wrap the content with BlocProvider to provide ArticleBloc to the widget tree
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Trending Content
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Trending',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ),
                    TrendingArticlesSection(), // This section dynamically displays articles
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Latest',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ),
                    LatestArticlesSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build each app bar tab with rounded rectangular border
  Widget _buildAppBarTab(String text) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.pinkAccent, width: 1),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
