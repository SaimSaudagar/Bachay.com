import 'package:app/Screens/Quiz/Single_Quiz.dart';
import 'package:app/Screens/Quiz/Widgets/How_It_Works.dart';
import 'package:flutter/material.dart';
import 'Widgets/Quiz_Appbar.dart';
import 'Widgets/Quiz_Description_Widget.dart';
import 'Widgets/Quiz_Image_Display.dart';
import 'Widgets/Quiz_Info_Card.dart';
import 'Widgets/Quiz_Top_Scores.dart';

class QuizDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Apply padding to the entire column
          child: Column(
            children: [
              // Image with top padding
              SizedBox(
                height: 300, // Provide height based on your layout
                width: double.infinity, // Set width to fit the screen
                child: const BorderedImageWidget(
                    assetPath: 'assets/logo/quizoftheday.png'),
              ),

              // Info Card with spacing between
              SizedBox(height: 20), // Add spacing between widgets
              QuizInfoCard(
                questions: 20, // Number of questions
                played: '1.2k', // Times played
                favorites: 125, // Number of favorites
                points: 100, // Points earned
              ),

              // Description widget
              SizedBox(height: 20), // Add spacing before the description
              DescriptionWidget(
                title: 'Description',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              ),

              // Top Scores widget
              SizedBox(height: 20), // Add spacing before the top scores
              TopScoresWidget(), // Display the top scores list
              SizedBox(height: 20),
              HowItWorksWidget(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(),
                    ),
                  );
                },
                child: Text('Play Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
