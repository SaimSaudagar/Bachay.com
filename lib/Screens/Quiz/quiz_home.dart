import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Home/Homepage.dart';
import 'Widgets/Quiz_Appbar.dart';
import 'Widgets/Quiz_Category_Card.dart';
import 'Widgets/Quiz_Image_Container.dart';
import 'Widgets/Quiz_Most_Recent_Card.dart';
import 'Widgets/Quiz_Popular_Card.dart';
import 'Widgets/Quiz_Progress_Card.dart';
import 'Widgets/Quiz_Searchbar.dart';

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
