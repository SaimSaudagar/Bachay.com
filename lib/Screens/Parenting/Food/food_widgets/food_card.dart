import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';
import '../food_detail.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl; // Image URL from backend
  final String foodName; // Food name from backend
  final List<String> nutrients; // List of nutrients from backend
  final Map<String, bool> tags; // Tags with true (check) or false (remove) from backend

  const FoodCard({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.nutrients,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to FoodDetail screen on card press
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(
              imageUrl: imageUrl,
              foodName: foodName,
              nutrients: nutrients,
              tags: tags,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image inside a rounded rectangular box and Food Name
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius), // Rounded rectangle for image
                    child: Image.network(
                      imageUrl, // Dynamic image URL from backend
                      width: double.infinity,
                      height: 150, // Responsive height
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, color: Colors.red); // Fallback if image fails to load
                      },
                    ),
                  ),
                  Text(
                    foodName, // Dynamic food name from backend
                    style: outfitBold.copyWith(
                      fontSize: getBigFontSize(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nutrient Icon and Text
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/food.png', // Replace with actual path
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: getSpacing(context)),
                        Text(
                          'Nutrients',
                          style: interBold.copyWith(
                            fontSize: getFontSize(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getSpacing(context)),
                    // Nutrients list from backend
                    Text(
                      nutrients.join(', '), // Display nutrients in a comma-separated format
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                      ),
                    ),
                    SizedBox(height: getSpacing(context)),
                    // Divider
                    Divider(color: Colors.grey),
                    // Tags with Icons, dynamically generated from backend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: tags.entries.map((entry) {
                        return _buildTag(
                          context,
                          entry.key, // Tag name (e.g., Baby, Postpartum)
                          entry.value ? Icons.check_circle : Icons.remove_circle, // Check or remove icon based on boolean value
                          entry.value ? Colors.green : Colors.yellow, // Green for true, yellow for false
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for tag display
  Widget _buildTag(BuildContext context, String label, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: getFontSize(context) * 1.5),
        SizedBox(width: getSpacing(context)),
        Text(
          label,
          style: interRegular.copyWith(
            fontSize: getFontSize(context),
          ),
        ),
      ],
    );
  }
}
