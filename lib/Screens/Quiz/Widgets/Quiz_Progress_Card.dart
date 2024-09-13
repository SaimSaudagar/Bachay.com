import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class QuizProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(15), // Same border radius as QuizSearchBar
          border: Border.all(
            color: Colors.black
                .withOpacity(1), // Same border color as QuizSearchBar
            width: 1.5, // Same border thickness as QuizSearchBar
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(1), // Same shadow color as QuizSearchBar
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2), // Same shadow offset as QuizSearchBar
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/images/boy-icon.png'), // Replace with your image asset
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Quiz',
                      style: outfitRegular.copyWith(
                          color: fontcolor, fontSize: getBigFontSize(context))),
                  Text('Movie Mania',
                      style: outfitBold.copyWith(
                          fontSize: getBigFontSize(context))),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.5, // Adjust to represent progress
                            backgroundColor: Colors.grey.shade300,
                            color: Colors.amber,
                            minHeight: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '50%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.black.withOpacity(1), // Border color
                    width: 1.5, // Border thickness
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Continue', style: outfitRegular),
            ),
          ],
        ),
      ),
    );
  }
}