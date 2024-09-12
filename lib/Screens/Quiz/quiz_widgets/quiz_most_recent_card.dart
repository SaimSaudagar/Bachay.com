import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import '../../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../../API/Bloc/Quiz/quiz_event.dart';
import '../../../API/Bloc/Quiz/quiz_state.dart';
import '../../../API/Repository/quiz_repo.dart';
import '../../../Models/Quiz/Quiz.dart';

class MostRecentQuizCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int numQuestions;
  final String quizType;
  final int numPlays;

  MostRecentQuizCard({
    required this.title,
    required this.imagePath,
    required this.numQuestions,
    required this.quizType,
    required this.numPlays,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(0.8),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.8), width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$numQuestions Questions • $quizType • ${numPlays}k Plays',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MostRecentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostRecentQuizBloc(MostRecentQuizRepository())
        ..add(FetchMostRecentQuizzes()),
      child: BlocBuilder<MostRecentQuizBloc, MostRecentQuizState>(
        builder: (context, state) {
          if (state is MostRecentQuizLoading) {
            return _buildShimmerEffect();
          } else if (state is MostRecentQuizLoaded) {
            return _buildMostRecentQuizList(state.mostRecentQuizzes);
          } else if (state is MostRecentQuizError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No most recent quizzes available'));
          }
        },
      ),
    );
  }

  // Shimmer Effect for loading state
  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: List.generate(2, (index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 120, // Match the height of your quiz card
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMostRecentQuizList(List<MostRecentQuiz> quizzes) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Recents',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" navigation here
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: quizzes.length,
            itemBuilder: (context, index) {
              final quiz = quizzes[index];
              return MostRecentQuizCard(
                title: quiz.name,
                imagePath: quiz.image,
                numQuestions: 15, // You can hardcode this if not provided by the API
                quizType: 'General', // Hardcode if not provided
                numPlays: 1, // Hardcode if not provided
              );
            },
          ),
        ],
      ),
    );
  }
}
