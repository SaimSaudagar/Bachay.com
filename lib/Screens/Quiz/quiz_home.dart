import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  QuizAppBar({Key? key})
      : preferredSize = const Size.fromHeight(100.0),
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
            Spacer(),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/boy-icon.png'), // replace with your image asset
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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Updated to match rounded edges
        border: Border.all(
          color: Colors.black.withOpacity(1), // Adjusted to give a subtle border
          width: 1.5, // Border thickness matching the UI
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1), // Adjusted shadow color
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // Subtle shadow for depth
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/search.svg'),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/filter.svg'),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600, // Hint text color to match the UI
            fontWeight: FontWeight.w500, // Adjust font weight for better visibility
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
    'assets/images/article.png', // Replace with your actual image paths
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
              offset: Offset(0, 4),
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
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class QuizHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppBar(),
      body: Column(
        children: [
          QuizSearchBar(),
          QuizImageContainer(), // Add the image container below the search bar
          // Add other widgets here
        ],
      ),
    );
  }
}
