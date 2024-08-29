import 'package:flutter/material.dart';

import '../../Widgets/parenting_hamburger.dart';
import 'Articles/articles.dart';
import 'Feed/feed.dart';
import 'parenting_appbar.dart';

class ParentingApp extends StatefulWidget {
  @override
  _ParentingAppState createState() => _ParentingAppState();
}

class _ParentingAppState extends State<ParentingApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ParentingAppBar(tabController: _tabController),
      drawer: ParentingHamburger(), // Add this line to include the drawer
      body: TabBarView(
        controller: _tabController,
        children: [
          FeedsScreen(),  // Feeds Screen
          ArticlesScreen(),               // Articles Screen
          Center(child: Text('Q/A')),     // Q/A Screen
          Center(child: Text('Vaccine')), // Vaccine Screen
          Center(child: Text('Food')),    // Food Screen
        ],
      ),
    );
  }
}
