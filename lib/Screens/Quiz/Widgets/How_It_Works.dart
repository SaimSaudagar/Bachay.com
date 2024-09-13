import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/app_constants.dart'; // Import your constants for responsiveness

class HowItWorksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fontSize = getFontSize(context); // Responsive font size
    double bigFontSize = getBigFontSize(context); // Larger font size for headers
    double padding = getPadding(context); // Responsive padding

    return Padding(
      padding: EdgeInsets.all(padding),  // Apply responsive padding for overall content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How it works',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: bigFontSize,  // Responsive heading size
              color: Colors.black,
            ),
          ),
          SizedBox(height: getSpacing(context) * 2),
          _buildHowItWorksCard(
            context,
            title: 'Login',
            description:
                'In order to be eligible for the Quiz, you must sign-in to or sign-up from an account on the Bachay.com App.',
            backgroundImage: 'assets/logo/loginbutton.svg',
          ),
          SizedBox(height: getSpacing(context) * 2),
          _buildHowItWorksCard(
            context,
            title: 'How to win?',
            description:
                'The user will have to answer all the quiz questions correctly, to be eligible for a lucky draw.',
            backgroundImage: 'assets/logo/howtowin.svg',
          ),
          SizedBox(height: getSpacing(context) * 2),
          _buildHowItWorksCard(
            context,
            title: 'Rewards',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.',
            backgroundImage: 'assets/logo/rewards.svg',
          ),
        ],
      ),
    );
  }

  // Widget for individual cards
  Widget _buildHowItWorksCard(
    BuildContext context, {
    required String title,
    required String description,
    required String backgroundImage,
  }) {
    double fontSize = getFontSize(context); // Responsive font size for card text
    double bigFontSize = getBigFontSize(context); // Responsive heading size for card

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getPadding(context)),  // Responsive padding for the card
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: bigFontSize,  // Responsive font size for title
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getSpacing(context)),
              Text(
                description,
                style: TextStyle(
                  fontSize: fontSize,  // Responsive font size for description
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: Opacity(
            opacity: 0.2,  // Control image transparency
            child: SvgPicture.asset(
              backgroundImage,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.5,  // Adjust image width responsively
            ),
          ),
        ),
      ],
    );
  }
}
