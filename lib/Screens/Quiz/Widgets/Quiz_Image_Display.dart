// File: lib/Screens/Quiz/Widgets/Quiz_Image_Display.dart

import 'package:flutter/material.dart';

class BorderedImageWidget extends StatelessWidget {
  final String imageUrl; // Renamed for clarity
  final double borderRadius;
  final double borderWidth;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;

  const BorderedImageWidget({
    Key? key,
    required this.imageUrl, // Updated parameter name
    this.borderRadius = 15.0, // Updated default value to match usage
    this.borderWidth = 1.5,
    this.shadowBlurRadius = 3.0,
    this.shadowSpreadRadius = 1.0,
    this.shadowOffset = const Offset(0, 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxHeight == double.infinity ? 200 : constraints.maxHeight;
        double imageWidth = constraints.maxWidth == double.infinity ? 200 : constraints.maxWidth;

        return Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
            color: Colors.white,  // Set background color to white
            borderRadius: BorderRadius.circular(borderRadius),  // Use variable
            border: Border.all(
              color: Colors.black.withOpacity(1),  // Border color
              width: borderWidth,  // Border width
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),  // Shadow color
                spreadRadius: shadowSpreadRadius,  // Shadow spread
                blurRadius: shadowBlurRadius,  // Shadow blur
                offset: shadowOffset,  // Shadow offset
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),  // Border radius for clipping
            child: Image.network(
              imageUrl, // Use Image.network for network images
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey));
              },
            ),
          ),
        );
      },
    );
  }
}
