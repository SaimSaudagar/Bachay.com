import 'package:flutter/material.dart';
import 'Widgets/food_card.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  TabController? _appBarTabController;

  @override
  void initState() {
    super.initState();
    _appBarTabController = TabController(length: 6, vsync: this);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal Scrollable Tabs
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: TabBar(
                controller: _appBarTabController,
                isScrollable: true,
                labelColor: Colors.pinkAccent,
                unselectedLabelColor: Colors.black,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                tabs: [
                  _buildAppBarTab("All",
                      isSelected: _appBarTabController!.index == 0),
                  _buildAppBarTab("Whole Grain",
                      isSelected: _appBarTabController!.index == 1),
                  _buildAppBarTab("Vegetables & Fungus",
                      isSelected: _appBarTabController!.index == 2),
                  _buildAppBarTab("Nuts",
                      isSelected: _appBarTabController!.index == 3),
                  _buildAppBarTab("Dairy",
                      isSelected: _appBarTabController!.index == 4),
                  _buildAppBarTab("Processed",
                      isSelected: _appBarTabController!.index == 5),
                ],
              ),
            ),
            // Example FoodCard Usage
            const FoodCard(
              imageUrl: 'https://via.placeholder.com/150',
              foodName: 'Noodles',
              nutrients: ['Calories', 'Fat', 'Carbs', 'Protein', 'Sodium'],
              tags: {
                'Vegan': true,
                'Gluten Free': false,
                'Dairy Free': true,
                'Low Calorie': true,
                'Vitamin C': true
              },
            ),
            const FoodCard(
              imageUrl: 'https://via.placeholder.com/150',
              foodName: 'Noodles',
              nutrients: ['Calories', 'Fat', 'Carbs', 'Protein', 'Sodium'],
              tags: {
                'Vegan': true,
                'Gluten Free': false,
                'Dairy Free': true,
                'Low Calorie': true,
                'Vitamin C': true
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each tab with rounded rectangular border
  Widget _buildAppBarTab(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.pinkAccent.withOpacity(0.1) : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.pinkAccent : Colors.black,
          ),
        ),
      ),
    );
  }
}
