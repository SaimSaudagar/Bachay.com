import 'package:app/Widgets/Botton_Nav_Bar.dart';
import 'package:flutter/material.dart';

import '../../Widgets/parenting_hamburger.dart';
import 'Articles/Articles.dart';
import 'Feed/feed.dart';
import 'Food/food.dart';
import 'Q&A/q&a.dart';
import 'Vaccine/vaccine.dart';
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
      drawer: const ParentingHamburger(), // Add this line to include the drawer
      body: TabBarView(
        controller: _tabController,
        children: [
          FeedsScreen(),  // Feeds Screen
          ArticlesScreen(),               // Articles Screen
          QAscreen(),     // Q/A Screen
          VaccineScreen(), // Vaccine Screen
          FoodScreen(),    // Food Screen
        ],
      ),
   bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (index) {
          if (index == 2) {
            // No additional action is needed since you're already on the Parenting screen
          } else {
            // Handle other tab selections if needed
          }
        },
        initialIndex: 2,  // Set the initial index to 2 for Parenting
      ),
    );
  }
}
