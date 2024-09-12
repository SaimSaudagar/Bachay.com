import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import '../../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../../API/Bloc/Quiz/quiz_event.dart';
import '../../../API/Bloc/Quiz/quiz_state.dart';
import '../../../API/Repository/quiz_repo.dart';
import '../../../Models/Quiz/Quiz.dart';
import '../quiz_description.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int numQuestions;
  final String quizType;
  final int numPlays;
  final VoidCallback onPressed;

  QuizCard({
    required this.title,
    required this.imagePath,
    required this.numQuestions,
    required this.quizType,
    required this.numPlays,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed,
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
                child: Image.network(
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
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
    return BlocProvider(
      create: (context) => PopularQuizBloc(PopularQuizRepository())
        ..add(FetchPopularQuizzes()),
      child: BlocBuilder<PopularQuizBloc, PopularQuizState>(
        builder: (context, state) {
          if (state is PopularQuizLoading) {
            return _buildShimmerEffect();
          } else if (state is PopularQuizLoaded) {
            return _buildQuizList(state.popularQuizzes);
          } else if (state is PopularQuizError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No popular quizzes available'));
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
              height: 300, // Match the height of your quiz card
              width: double.infinity,
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

  Widget _buildQuizList(List<PopularQuiz> quizzes) {
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" navigation here
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
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
              return QuizCard(
                title: quiz.name,
                imagePath: quiz.image,
                numQuestions: 15, // You can hardcode if not provided by API
                quizType: 'General', // Hardcode if not provided by API
                numPlays: 1, // You can hardcode if not provided by API
                onPressed: () {
                  // Handle quiz card tap here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizDescription(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
