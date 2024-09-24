import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../API/Bloc/Quiz/quiz_event.dart';
import '../../API/Repository/quiz_repo.dart';
import '../../Models/Quiz/quiz.dart';
import 'Widgets/How_It_Works.dart';
import 'Widgets/Quiz_Appbar.dart';
import 'Widgets/Quiz_Description_Widget.dart';
import 'Widgets/Quiz_Image_Display.dart';
import 'Widgets/Quiz_Info_Card.dart';
import 'Widgets/Quiz_Top_Scores.dart';

class QuizDescription extends StatelessWidget {
  final int quizId;

  const QuizDescription({required this.quizId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizDetailBloc(QuizDetailRepository())..add(FetchQuizDetail(quizId)),
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
            ElevatedButton(
              onPressed: () {
                // Implement quiz start functionality here
              },
              child: Text('Play Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
