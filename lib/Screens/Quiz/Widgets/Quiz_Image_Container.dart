import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';  // Import the shimmer package
import '../../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../../API/Bloc/Quiz/quiz_event.dart';
import '../../../API/Bloc/Quiz/quiz_state.dart';

class QuizImageContainer extends StatefulWidget {
  @override
  _QuizImageContainerState createState() => _QuizImageContainerState();
}

class _QuizImageContainerState extends State<QuizImageContainer> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Trigger fetching of banners
    BlocProvider.of<QuizBannerBloc>(context).add(FetchQuizBanners());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBannerBloc, QuizBannerState>(
      builder: (context, state) {
        if (state is QuizBannerLoading) {
          return _buildShimmerEffect();  // Show shimmer effect when loading
        } else if (state is QuizBannerLoaded) {
          final images = state.quizBanners.map((banner) => banner.image).toList();
          return _buildImageCarousel(images);
        } else if (state is QuizBannerError) {
          return Center(child: Text('Error loading banners'));
        } else {
          return Center(child: Text('No banners available'));
        }
      },
    );
  }

  // Build Shimmer Effect
  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding around the container
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 250, // Adjust height to match your design
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // Build Image Carousel
  Widget _buildImageCarousel(List<String> images) {
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
                  return Image.network(
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
