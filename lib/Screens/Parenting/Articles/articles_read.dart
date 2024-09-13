import 'package:app/Screens/Parenting/Articles/Articles_widgets/Latest_Articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String content; // HTML content from the API
  final String imageUrl;
  final String sourceName;
  final String date;

  const ArticleDetailScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.sourceName,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: getPadding(context) * 0.5),
          child: IconButton(
            icon: SvgPicture.asset('assets/images/Back-Button.svg'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo/Parenting.svg',
              height: getFontSize(context) * 3,
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getPadding(context) * 0.5),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/share.svg',
                color: Colors.black,
                width: getFontSize(context) * 2,
                height: getFontSize(context) * 2,
              ),
              onPressed: () {
                // Handle share action
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: getPadding(context) * 0.5),
            child: IconButton(
              icon: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/notification.svg',
                    color: Colors.black,
                    width: getFontSize(context) * 2,
                    height: getFontSize(context) * 2,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '02',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getFontSize(context) * 0.8,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // Handle notification action
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // Article Source, Date
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 12,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    sourceName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Featured Image
              Image.network(imageUrl, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 16),
              // HTML Content Rendering
              HtmlWidget(
                content, // The HTML content from the API
                textStyle: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }

  double getPadding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.04;
  }

  double getFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.04;
  }
}
