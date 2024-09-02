import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Widgets/article_card_small.dart';
import '../../../Widgets/Botton_Nav_Bar.dart';
import '../../../Widgets/article_card_large.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> with TickerProviderStateMixin {
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
            // Remove the bottom divider or underline
            indicator: BoxDecoration(),
            tabs: [
              _buildAppBarTab("Read"),
              _buildAppBarTab("Video"),
              _buildAppBarTab("Popular"),
              _buildAppBarTab("Latest"),
              _buildAppBarTab("Saved"),
            ],
          ),
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
                    ArticleCardLarge(
                      imageUrl: 'https://via.placeholder.com/600',
                      sourceImageUrl: 'https://via.placeholder.com/24',
                      sourceName: 'Bachay.com',
                      isVerified: true,
                      title: 'Zinc in Pregnancy – Benefits, Dosage and Food Sources',
                      date: 'May 28 2024',
                    ),
                    SizedBox(height: 24),
                    ArticleCardSmall(
                      imageUrl: 'https://via.placeholder.com/24',
                      sourceImageUrl: 'https://via.placeholder.com/24',
                      sourceName: 'Bachay.com',
                      isVerified: true,
                      title: 'Babyhug Froggy Gyro Swing Car With Easy Steering Wheels Review',
                      description: 'We were super excited when the Babyhug Froggy Gyro Swing Car was delivered...',
                      date: 'May 28 2024',
                    ),
                    // Add more ArticleCardSmall widgets here if needed
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
