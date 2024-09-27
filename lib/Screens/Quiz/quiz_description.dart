import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../API/Bloc/Quiz/quiz_event.dart';
import '../../API/Bloc/Quiz/quiz_state.dart';
import '../../API/Repository/quiz_repo.dart';
import '../../Models/Quiz/quiz.dart';
import 'Widgets/How_It_Works.dart';
import 'Widgets/Quiz_Appbar.dart';
import 'Widgets/Quiz_Description_Widget.dart';
import 'Widgets/Quiz_Image_Display.dart';
import 'Widgets/Quiz_Info_Card.dart';
import 'Widgets/Quiz_Top_Scores.dart';
import 'quiz_play.dart';

class QuizDescription extends StatelessWidget {
  final int quizId;

  const QuizDescription({required this.quizId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuizDetailBloc(QuizDetailRepository())..add(FetchQuizDetail(quizId)),
      child: Scaffold(
        appBar: QuizAppBar(),
        body: BlocBuilder<QuizDetailBloc, QuizDetailState>(
          builder: (context, state) {
            if (state is QuizDetailLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuizDetailLoaded) {
              return _buildQuizDetail(context, state.quizDetail);
            } else if (state is QuizDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );
  }

  Widget _buildQuizDetail(BuildContext context, QuizDetail quizDetail) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Apply padding to the entire column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with top padding
            SizedBox(
              height: 300, // Provide height based on your layout
              width: double.infinity, // Set width to fit the screen
              child: BorderedImageWidget(
                imageUrl: quizDetail.image,
              ),
            ),
            // Info Card with spacing between
            SizedBox(height: 20), // Add spacing between widgets
            QuizInfoCard(
              questions: quizDetail.question, // Number of questions
              played: quizDetail.played.toString(), // Times played
              favorites: quizDetail.favorite, // Number of favorites
              points: quizDetail.points, // Points earned
              title: quizDetail.name, // Dynamic title
              subtitle: quizDetail.categoryName, // Dynamic subtitle
            ),
            // Description widget
            SizedBox(height: 20), // Add spacing before the description
            DescriptionWidget(
              title: 'Description',
              description: quizDetail.description ?? 'No description available.',
            ),
            // Top Scores widget
            SizedBox(height: 20), // Add spacing before the top scores
            TopScoresWidget(
              topScores: quizDetail.topScore,
            ),
            SizedBox(height: 20),
            HowItWorksWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
             Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => QuizPlayScreen(quizId:quizId, childId: 11)), // Replace with your next screen
    );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFEC85C), // Button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Rounded corners
              side: BorderSide(
                color: Colors.black, // Black border
                width: 2.0, // Border width
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0), // Button height
            shadowColor: Colors.black, // Shadow color
            elevation: 8.0, // Shadow elevation
          ),
          child: Text(
            'Play Quiz',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Black text color for contrast
            ),
          ),
        ),
      ),
    );
  }
}
