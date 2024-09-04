import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home/Homepage.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  QuizAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // removes default back button
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/logo/close.svg'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SvgPicture.asset(
              'assets/logo/bachay_education.svg',
              height: 40,
            ),
            const Spacer(),
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/boy-icon.png'), // replace with your image asset
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Kamran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_drop_down),
                SizedBox(width: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuizSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15), // Updated to match rounded edges
        border: Border.all(
          color:
              Colors.black.withOpacity(1), // Adjusted to give a subtle border
          width: 1.5, // Border thickness matching the UI
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1), // Adjusted shadow color
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // Subtle shadow for depth
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/search.svg'),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/filter.svg'),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600, // Hint text color to match the UI
            fontWeight:
                FontWeight.w500, // Adjust font weight for better visibility
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}

class QuizImageContainer extends StatefulWidget {
  @override
  _QuizImageContainerState createState() => _QuizImageContainerState();
}

class _QuizImageContainerState extends State<QuizImageContainer> {
  final PageController _controller = PageController();
  final List<String> images = [
    'assets/logo/quizoftheday.png', // Replace with your actual image paths
    'assets/images/article.png',
    'assets/images/article.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding around the container
      child: Container(
        height: 250, // Adjust height to match your design
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                bottom: 10, // Position the dots indicator inside the container
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

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

class ScrollableCategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  ScrollableCategoryCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Adjust width as necessary
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(1), // Subtle border color
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1), // Lighter shadow
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
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imagePath,
              height: 50, // Adjust size as necessary
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190, // Adjust height to match your design
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ScrollableCategoryCard(
            title: 'All Category',
            description:
                'All kind of categories from education to tech and more.',
            imagePath:
                'assets/logo/allcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.amber.shade100, // Adjust to match the background color
          ),
          ScrollableCategoryCard(
            title: 'Education Quiz',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imagePath:
                'assets/logo/educationcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.blue.shade100, // Adjust to match the background color
          ),
          ScrollableCategoryCard(
            title: 'Science Quiz',
            description: 'Test your knowledge on various science topics.',
            imagePath:
                'assets/logo/educationcategory.png', // Replace with your actual image path
            backgroundColor:
                Colors.red.shade100, // Adjust to match the background color
          ),
        ],
      ),
    );
  }
}


class QuizCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int numQuestions;
  final String quizType;
  final int numPlays;

  QuizCard({
    required this.title,
    required this.imagePath,
    required this.numQuestions,
    required this.quizType,
    required this.numPlays,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            const Divider(thickness: 3,color: Colors.black,),
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
                style: outfitBold.copyWith(fontSize:getBigFontSize(context)*1.2),
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
              )
            ],
          ),
          QuizCard(
            title: 'Name the Dish',
            imagePath: 'assets/images/namethequiz.png', // Replace with actual image path
            numQuestions: 15,
            quizType: 'Educational',
            numPlays: 1,
          ),
          QuizCard(
            title: 'Identify the Alphabet',
            imagePath: 'assets/images/identifythealphabet.png', // Replace with actual image path
            numQuestions: 20,
            quizType: 'Educational',
            numPlays: 1,
          ),
        ],
      ),
    );
  }
}

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
            // Image container on the left
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
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Text information on the right
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
                        // Icon (for example, a star)
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
          // Add MostRecentQuizCard widgets
          MostRecentQuizCard(
            title: 'Name the Dish',
            imagePath: 'assets/images/namethequiz.png',
            numQuestions: 15,
            quizType: 'Educational',
            numPlays: 1,
          ),
          MostRecentQuizCard(
            title: 'Identify the Alphabet',
            imagePath: 'assets/images/identifythealphabet.png',
            numQuestions: 15,
            quizType: 'Educational',
            numPlays: 1,
          ),
          // Add more cards if needed
        ],
      ),
    );
  }
}


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
