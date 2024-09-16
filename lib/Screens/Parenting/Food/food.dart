// lib/Screens/Food/food.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../API/Bloc/Food/Food_Bloc.dart';
import '../../../API/Bloc/Food/Food_Event.dart';
import '../../../API/Bloc/Food/Food_State.dart';
import '../../../API/Repository/Food_Repo.dart';
import '../../../Models/Food/Food.dart';
import '../../../Utils/app_constants.dart';
import 'Widgets/food_card.dart';
import 'food_detail.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
    with SingleTickerProviderStateMixin {
  TabController? _appBarTabController;
  late FoodCategoryBloc foodCategoryBloc;
  late FoodBloc foodBloc;
  late AllFoodBloc allFoodBloc;

  @override
  void initState() {
    super.initState();
    // Initialize Repositories
    FoodCategoryRepository categoryRepository = FoodCategoryRepository();
    FoodRepository foodRepository = FoodRepository();
    AllFoodRepository allFoodRepository = AllFoodRepository();

    // Initialize Blocs
    foodCategoryBloc = FoodCategoryBloc(categoryRepository);
    foodBloc = FoodBloc(foodRepository: foodRepository);
    allFoodBloc = AllFoodBloc(allFoodRepository: allFoodRepository);

    // Load food categories
    foodCategoryBloc.add(LoadFoodCategories());
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    foodCategoryBloc.close();
    foodBloc.close();
    allFoodBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodCategoryBloc>(
          create: (context) => foodCategoryBloc,
        ),
        BlocProvider<FoodBloc>(
          create: (context) => foodBloc,
        ),
        BlocProvider<AllFoodBloc>(
          create: (context) => allFoodBloc,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
          builder: (context, categoryState) {
            if (categoryState is FoodCategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (categoryState is FoodCategoryLoaded) {
              // Initialize TabController only once
              if (_appBarTabController == null) {
                _appBarTabController = TabController(
                  length: categoryState.categories.length + 1, // +1 for 'All'
                  vsync: this,
                );

                // Load 'All' category initially
                allFoodBloc.add(LoadAllFoods());

                // Listener to handle tab selection
                _appBarTabController?.addListener(() {
                  if (_appBarTabController!.indexIsChanging) {
                    int index = _appBarTabController!.index;
                    if (index == 0) {
                      // 'All' category
                      allFoodBloc.add(LoadAllFoods());
                    } else {
                      // Specific category
                      FoodCategory selectedCategory =
                          categoryState.categories[index - 1];
                      foodBloc.add(LoadFoodsByCategory(
                          categoryId: selectedCategory.id));
                    }
                  }
                });
              }

              return Column(
                children: [
                  // TabBar with dynamic categories
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPadding(context),
                      vertical: getSpacing(context),
                    ), // Responsive padding
                    child: TabBar(
                      controller: _appBarTabController,
                      isScrollable: true,
                      labelColor: buttonColorPurple, // Using predefined color
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: buttonColorPurple.withOpacity(0.2), // Responsive indicator
                      ),
                      tabs: [
                        _buildAppBarTab("All", context),
                        ...categoryState.categories.map((category) {
                          return _buildAppBarTab(category.name, context);
                        }).toList(),
                      ],
                    ),
                  ),

                  // Expanded area to display FoodCards
                  Expanded(
                    child: TabBarView(
                      controller: _appBarTabController,
                      children: [
                        // 'All' Tab View
                        BlocBuilder<AllFoodBloc, AllFoodState>(
                          builder: (context, allFoodState) {
                            if (allFoodState is AllFoodLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (allFoodState is AllFoodsLoaded) {
                              if (allFoodState.foods.isEmpty) {
                                return Center(child: Text('No foods found'));
                              }
                              return ListView.builder(
                                itemCount: allFoodState.foods.length,
                                itemBuilder: (context, index) {
                                  final Food food = allFoodState.foods[index];
                                  return FoodCard(
                                    food: food, // Pass the entire Food object
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
                              );
                            } else if (allFoodState is AllFoodError) {
                              return Center(
                                  child: Text(
                                      'Failed to load foods: ${allFoodState.message}',
                                      style: interRegular.copyWith(
                                        fontSize: getFontSize(context),
                                        color: Colors.red,
                                      )));
                            }
                            return Container();
                          },
                        ),

                        // Category-specific Tab Views
                        ...categoryState.categories.map((category) {
                          return BlocBuilder<FoodBloc, FoodState>(
                            builder: (context, foodState) {
                              if (foodState is FoodLoading) {
                                return Center(child: CircularProgressIndicator());
                              } else if (foodState is FoodsLoaded) {
                                if (foodState.foods.isEmpty) {
                                  return Center(child: Text('No foods found'));
                                }
                                return ListView.builder(
                                  itemCount: foodState.foods.length,
                                  itemBuilder: (context, index) {
                                    final Food food = foodState.foods[index];
                                    return FoodCard(
                                      food: food, // Pass the entire Food object
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
                                );
                              } else if (foodState is FoodError) {
                                return Center(
                                    child: Text(
                                        'Failed to load foods: ${foodState.error}',
                                        style: interRegular.copyWith(
                                          fontSize: getFontSize(context),
                                          color: Colors.red,
                                        )));
                              }
                              return Container();
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              );
            } else if (categoryState is FoodCategoryError) {
              return Center(
                  child: Text(
                      'Failed to load categories: ${categoryState.message}',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.red,
                      )));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildAppBarTab(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPadding(context),
        vertical: getSpacing(context)*1.5,
      ), // Responsive padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey.withOpacity(0.1), // Using predefined color
      ),
      child: Text(
        text,
        style: interBold.copyWith(
          fontSize: getFontSize(context),
        ),
      ),
    );
  }
}
