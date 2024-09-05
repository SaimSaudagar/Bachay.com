import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Home/Homepage.dart';
import 'quiz_widgets/quiz_appbar.dart';
import 'quiz_widgets/quiz_category_card.dart';
import 'quiz_widgets/quiz_image_container.dart';
import 'quiz_widgets/quiz_most_recent_card.dart';
import 'quiz_widgets/quiz_popular_card.dart';
import 'quiz_widgets/quiz_progress_card.dart';
import 'quiz_widgets/quiz_searchbar.dart';

class QuizHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizSearchBar(),
            QuizImageContainer(), // Add the image container below the search bar
            QuizProgressCard(), // Add the progress card below the image container
            HorizontalScrollCards(),
            PopularQuizSection(),
            MostRecentSection(),
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
