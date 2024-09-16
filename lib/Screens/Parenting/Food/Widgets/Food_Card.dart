// food_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // If you need SVG support
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../Models/Food/Food.dart';
import '../../../../Utils/app_constants.dart';

class FoodCard extends StatelessWidget {
  final Food food; // Accept the entire Food object
  final VoidCallback onTap; // Callback when the card is tapped

  const FoodCard({
    Key? key,
    required this.food,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse nutrients string into a list
    List<String> nutrientsList =
        food.nutrients.split(',').map((e) => e.trim()).toList();

    return GestureDetector(
      onTap: onTap, // Navigate to detail on tap
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)), // Responsive padding
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          elevation: 4, // Adds a subtle shadow to the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container with Black Overlay and Food Name
              Stack(
                children: [
                  // Image Container
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
                    child: CachedNetworkImage(
                      imageUrl: food.image,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25, // Responsive height
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[200],
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.broken_image, color: Colors.red, size: MediaQuery.of(context).size.width * 0.1), // Responsive icon size
                      ),
                    ),
                  ),
                  // Black Overlay
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25, // Responsive height
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
                    ),
                  ),
                  // Food Name Positioned at the Center
                  Positioned.fill(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: getPadding(context)), // Responsive padding
                        child: Text(
                          food.name,
                          textAlign: TextAlign.center,
                          style: interBold.copyWith( // Using predefined TextStyle
                            fontSize: getBigFontSize(context), // Responsive font size
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Nutrients Section
              Padding(
                padding: EdgeInsets.all(getPadding(context)), // Responsive padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nutrients Icon and Label
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/nutrients.png', // Ensure this asset exists
                          width: MediaQuery.of(context).size.width * 0.06, // Responsive width
                          height: MediaQuery.of(context).size.width * 0.06, // Responsive height
                        ),
                        SizedBox(width: getSpacing(context)), // Responsive spacing
                        Text(
                          'Nutrients',
                          style: interBold.copyWith( // Using predefined TextStyle
                            fontSize: getFontSize(context), // Responsive font size
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getSpacing(context)), // Responsive spacing
                    // Nutrients List
                    Text(
                      nutrientsList.join(', '),
                      style: interRegular.copyWith( // Using predefined TextStyle
                        fontSize: getFontSize(context), // Responsive font size
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              Divider(
                thickness: 1,
                color: Colors.grey[300],
                indent: getPadding(context), // Responsive indent
                endIndent: getPadding(context), // Responsive end indent
              ),

              // Tags Section using AdditionalInfo
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPadding(context),
                  vertical: getSpacing(context),
                ), // Responsive padding
                child: Wrap(
                  spacing: getSpacing(context), // Responsive spacing
                  runSpacing: getSpacing(context), // Responsive run spacing
                  children: food.additionalInfo.map((info) {
                    return Chip(
                      avatar: _buildIcon(context, info.icon),
                      label: Text(
                        info.title,
                        style: interRegular.copyWith( // Using predefined TextStyle
                          color: Colors.blue[800],
                          fontSize: getFontSize(context), // Responsive font size
                        ),
                      ),
                      backgroundColor: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius / 2), // Responsive border radius
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build icon widget based on icon path or type
  Widget _buildIcon(BuildContext context, String iconPath) {
    if (iconPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: MediaQuery.of(context).size.width * 0.04, // Responsive width
        height: MediaQuery.of(context).size.width * 0.04, // Responsive height
        color: Colors.blue[800],
      );
    } else {
      return Image.asset(
        iconPath,
        width: MediaQuery.of(context).size.width * 0.04, // Responsive width
        height: MediaQuery.of(context).size.width * 0.04, // Responsive height
        fit: BoxFit.contain,
      );
    }
  }
}
