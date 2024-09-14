import 'package:app/API/Repository/Food_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Utils/app_constants.dart';
import 'package:app/Models/Food/Food.dart'; // Assuming this is the correct import for your Food model
import 'package:app/API/Bloc/Food/Food_Bloc.dart'; // Import your BLoC classes
import 'package:app/API/Bloc/Food/Food_Event.dart';
import 'package:app/API/Bloc/Food/Food_State.dart';

class FoodDetail extends StatefulWidget {
  final int foodId; // Accepting only the foodId in the constructor

  const FoodDetail({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetail> {
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
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
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
      body: BlocProvider(
        create: (context) => FoodBloc(foodRepository: FoodRepository())
          ..add(LoadFoodDetail(foodId: widget.foodId)),
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FoodDetailsLoaded) {
              return _buildFoodDetailPage(context, state.foodDetails.food);
            } else if (state is FoodDetailsError) {
              return Center(child: Text('Failed to load food details.'));
            } else {
              // Default empty state
              return Container();
            }
          },
        ),
      ),
    );
  }

  // Building the page with the Food data
  Widget _buildFoodDetailPage(BuildContext context, Food food) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                food.image, // Display the food image
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              food.name, // Display the food name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Nutrients: ${food.nutrients}", // Display nutrients
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...food.additionalInfo.map((info) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    // Image.network(info.icon,
                    //     width: 10, height: 10), // Display the icon
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(info.description), // Display the description
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
