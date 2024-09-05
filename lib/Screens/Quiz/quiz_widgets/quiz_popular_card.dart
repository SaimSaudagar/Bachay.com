import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../quiz_description.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int numQuestions;
  final String quizType;
  final int numPlays;
  final VoidCallback onPressed; // Add this to accept the onPressed callback

  QuizCard({
    required this.title,
    required this.imagePath,
    required this.numQuestions,
    required this.quizType,
    required this.numPlays,
    required this.onPressed, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed, // Add onTap here to handle card taps
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black.withOpacity(1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Divider(thickness: 3, color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 40, // Adjust size as needed
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Circle border color
                          width: 2.0, // Bold border
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.more_horiz, color: Colors.black),
                        onPressed: () {
                          // Handle more options here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '$numQuestions Questions   •   $quizType   •   ${numPlays}k Plays',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularQuizSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Quiz',
                style: outfitBold.copyWith(fontSize: getBigFontSize(context) * 1.2),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" navigation here
                },
                child: Text(
                  'See All',
                  style: outfitBold.copyWith(
                    color: Colors.blueAccent,
                    fontSize: getBigFontSize(context),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          QuizCard(
            title: 'Name the Dish',
            imagePath: 'assets/images/namethequiz.png', // Replace with actual image path
            numQuestions: 15,
            quizType: 'Educational',
            numPlays: 1,
            onPressed: () {
              // Handle what happens when the card is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizDescription()), // Example
              );
            },
          ),
          QuizCard(
            title: 'Identify the Alphabet',
            imagePath: 'assets/images/identifythealphabet.png', // Replace with actual image path
            numQuestions: 20,
            quizType: 'Educational',
            numPlays: 1,
            onPressed: () {
              // Handle what happens when the card is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizDescription()), // Example
              );
            },
          ),
        ],
      ),
    );
  }
}
