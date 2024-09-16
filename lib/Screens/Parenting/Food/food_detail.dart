// food_detail.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Models/Food/Food.dart';
import '../../../Utils/app_constants.dart';

class FoodDetail extends StatelessWidget {
  final Food food; // Accept the Food object directly

  const FoodDetail({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with back button and actions
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

      // Body with food details
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)), // Responsive padding
          child: Column(
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius), // Using predefined border radius
                child: Image.network(
                  food.image,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25, // Responsive height
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      height: MediaQuery.of(context).size.height * 0.25, // Responsive height
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    );
                  },
                ),
              ),
              SizedBox(height: getSpacing(context)), // Responsive spacing

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  food.name,
                  style: interBold.copyWith(
                    fontSize: getBigFontSize(context), // Responsive font size
                  ),
                ),
              ),
              Divider(),

              SizedBox(height: getSpacing(context)), // Responsive spacing

              // Nutrients
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nutrients: ${food.nutrients}",
                  style: interRegular.copyWith(
                    fontSize: getFontSize(context), // Responsive font size
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: getSpacing(context)), // Responsive spacing

              // List of Additional Info
              Column(
                children: food.additionalInfo.map((info) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: getSpacing(context)), // Responsive padding
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon based on info type
                        Image.network(
                          info.icon,
                          width: MediaQuery.of(context).size.width * 0.06, // Responsive icon size
                          height: MediaQuery.of(context).size.width * 0.06, // Responsive icon size
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.info, color: Colors.grey);
                          },
                        ),
                        SizedBox(width: getSpacing(context)), // Responsive spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info.title,
                                style: interBold.copyWith(
                                  fontSize: getFontSize(context), // Responsive font size
                                ),
                              ),
                              SizedBox(height: getSpacing(context)), // Responsive spacing
                              Text(
                                info.description,
                                style: interRegular.copyWith(
                                  fontSize: getFontSize(context), // Responsive font size
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
