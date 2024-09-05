import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollableCategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  ScrollableCategoryCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Adjust width as necessary
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(1), // Subtle border color
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1), // Lighter shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imagePath,
              height: 50, // Adjust size as necessary
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190, // Adjust height to match your design
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ScrollableCategoryCard(
            title: 'All Category',
            description:
                'All kind of categories from education to tech and more.',
            imagePath:
                'assets/logo/allcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.amber.shade100, // Adjust to match the background color
          ),
          ScrollableCategoryCard(
            title: 'Education Quiz',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imagePath:
                'assets/logo/educationcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.blue.shade100, // Adjust to match the background color
          ),
          ScrollableCategoryCard(
            title: 'Science Quiz',
            description: 'Test your knowledge on various science topics.',
            imagePath:
                'assets/logo/educationcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.red.shade100, // Adjust to match the background color
          ),
        ],
      ),
    );
  }
}