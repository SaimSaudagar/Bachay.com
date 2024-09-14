import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package
import '../../../API/Bloc/Quiz/Quiz_Bloc.dart';
import '../../../API/Bloc/Quiz/quiz_event.dart';
import '../../../API/Bloc/Quiz/quiz_state.dart';
import '../../../API/Repository/Quiz_Repo.dart';
import '../../../Models/Quiz/Quiz.dart';  // Ensure consistent model import

class ScrollableQuizCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  ScrollableQuizCategoryCard({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
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
          Align(
            alignment: Alignment.bottomRight,
            child: Image.network(
              imagePath,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollCards extends StatefulWidget {
  @override
  _HorizontalScrollCardsState createState() => _HorizontalScrollCardsState();
}

class _HorizontalScrollCardsState extends State<HorizontalScrollCards> {
  late QuizCategoryBloc _quizCategoryBloc;

  @override
  void initState() {
    super.initState();
    _quizCategoryBloc = QuizCategoryBloc(QuizCategoryRepository());
    _quizCategoryBloc.add(FetchQuizCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _quizCategoryBloc,
      child: BlocBuilder<QuizCategoryBloc, QuizCategoryState>(
        builder: (context, state) {
          if (state is QuizCategoryLoading) {
            return _buildShimmerEffect(); // Show shimmer effect while loading
          } else if (state is QuizCategoryLoaded) {
            return _buildQuizCategoryList(state.quizCategories);
          } else if (state is QuizCategoryError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No quiz categories available'));
          }
        },
      ),
    );
  }

  // Shimmer Effect
  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // You can adjust the number of shimmer placeholders
            itemBuilder: (context, index) {
              return Container(
                width: 220,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCategoryList(List<QuizCategory> quizCategories) {
    return Container(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: quizCategories.length,
        itemBuilder: (context, index) {
          final category = quizCategories[index];
          return ScrollableQuizCategoryCard(
            title: category.name,
            imagePath: category.image,
            backgroundColor: Colors.grey.shade100, // Adjust the background color as necessary
          );
        },
      ),
    );
  }
}
