// food.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../API/Bloc/Food/Food_Bloc.dart';
import '../../../API/Bloc/Food/Food_Event.dart';
import '../../../API/Bloc/Food/Food_State.dart';
import '../../../API/Repository/Food_Repo.dart';
import '../../../Models/Food/Food.dart';
import 'Widgets/food_card.dart';
import 'food_detail.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
    with TickerProviderStateMixin {
  TabController? _appBarTabController;
  late FoodCategoryBloc foodCategoryBloc;
  late FoodBloc foodBloc;
  int selectedCategoryId = 0; // 0 for 'All'

  @override
  void initState() {
    super.initState();
    // Initialize Blocs
    foodCategoryBloc = FoodCategoryBloc(FoodCategoryRepository());
    foodBloc = FoodBloc(foodRepository: FoodRepository());

    // Load food categories
    foodCategoryBloc.add(LoadFoodCategories());
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    foodCategoryBloc.close();
    foodBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<FoodCategoryBloc>(
        create: (context) => foodCategoryBloc,
        child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
          builder: (context, categoryState) {
            if (categoryState is FoodCategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (categoryState is FoodCategoryLoaded) {
              // Initialize TabController with categories + 'All'
              _appBarTabController = TabController(
                length: categoryState.categories.length + 1,
                vsync: this,
              );

              // Load 'All' category initially
              foodBloc.add(LoadFoodsByCategory(categoryId: 0));

              // Listener to handle tab selection
              _appBarTabController?.addListener(() {
                if (_appBarTabController!.indexIsChanging) {
                  int index = _appBarTabController!.index;
                  if (index == 0) {
                    // 'All' category
                    selectedCategoryId = 0;
                  } else {
                    // Specific category
                    FoodCategory selectedCategory =
                        categoryState.categories[index - 1];
                    selectedCategoryId = selectedCategory.id;
                  }
                  // Load foods for selected category
                  foodBloc.add(LoadFoodsByCategory(
                      categoryId: selectedCategoryId));
                }
              });

              return Column(
                children: [
                  // TabBar with dynamic categories
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12.0),
                    child: TabBar(
                      controller: _appBarTabController,
                      isScrollable: true,
                      labelColor: Colors.pinkAccent,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pinkAccent.withOpacity(0.2),
                      ),
                      tabs: [
                        _buildAppBarTab("All"),
                        ...categoryState.categories.map((category) {
                          return _buildAppBarTab(category.name);
                        }).toList(),
                      ],
                    ),
                  ),

                  // FoodBloc Provider and Builder
                  BlocProvider<FoodBloc>(
                    create: (context) => foodBloc,
                    child: BlocBuilder<FoodBloc, FoodState>(
                      builder: (context, foodState) {
                        if (foodState is FoodLoading) {
                          return Expanded(
                              child: Center(child: CircularProgressIndicator()));
                        } else if (foodState is FoodsLoaded) {
                          if (foodState.foods.isEmpty) {
                            return Expanded(
                                child: Center(child: Text('No foods found')));
                          }
                          return Expanded(
                            child: ListView.builder(
                              itemCount: foodState.foods.length,
                              itemBuilder: (context, index) {
                                final Food food = foodState.foods[index];
                                return FoodCard(
                                  imageUrl: food.image,
                                  foodName: food.name,
                                  nutrients: food.nutrients.split(', '),
                                  tags: {
                                    "Postpartum": food.additionalInfo
                                        .any((info) =>
                                            info.title == "Postpartum"),
                                    "Baby":
                                        food.additionalInfo.any((info) => info.title == "Baby"),
                                    "Breastfeeding": food.additionalInfo
                                        .any((info) =>
                                            info.title == "Breastfeeding"),
                                    "Pregnancy": food.additionalInfo
                                        .any((info) =>
                                            info.title == "Pregnancy"),
                                  },
                                  onTap: () {
                                    // Navigate to FoodDetail screen with Food object
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FoodDetail(food: food),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else if (foodState is FoodError) {
                          return Expanded(
                              child: Center(
                                  child: Text('Failed to load foods: ${foodState.error}')));
                        }
                        return Expanded(child: Container());
                      },
                    ),
                  ),
                ],
              );
            } else if (categoryState is FoodCategoryError) {
              return Center(child: Text('Failed to load categories: ${categoryState.message}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildAppBarTab(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pinkAccent.withOpacity(0.1),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.pinkAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
