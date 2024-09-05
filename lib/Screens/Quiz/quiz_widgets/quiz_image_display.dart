import 'package:flutter/material.dart';

class BorderedImageWidget extends StatelessWidget {
  final String assetPath;
  final double borderRadius;
  final double borderWidth;
  final double bottomBorderWidth;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;

  const BorderedImageWidget({
    Key? key,
    required this.assetPath,
    this.borderRadius = 12.0,
    this.borderWidth = 8.0,
    this.bottomBorderWidth = 16.0,
    this.shadowBlurRadius = 10.0,
    this.shadowSpreadRadius = 1.0,
    this.shadowOffset = const Offset(4, 4),
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
            borderRadius: BorderRadius.circular(15),  // Match new border radius
            border: Border.all(
              color: Colors.black.withOpacity(1),  // Match border color
              width: 1.5,  // Match new border width
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),  // Match shadow color
                spreadRadius: 1,  // Match spread radius
                blurRadius: 3,  // Match blur radius
                offset: const Offset(0, 2),  // Match shadow offset
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),  // Match new border radius for image clipping
            child: Image.asset(
              assetPath,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
