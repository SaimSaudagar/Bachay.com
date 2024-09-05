import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Utils/app_constants.dart';

class QuizInfoCard extends StatelessWidget {
  final int questions;
  final String played;
  final int favorites;
  final int points;

  QuizInfoCard({
    required this.questions,
    required this.played,
    required this.favorites,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.1;
    double cardWidth = MediaQuery.of(context).size.width * 0.2;
    double spacing = getSpacing(context);
    double fontSize = getFontSize(context);
    double bigFontSize = getBigFontSize(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Educational – Food',
            style: outfitRegular.copyWith(
              fontSize: fontSize * 1.5,
              color: Color.fromRGBO(191, 143, 57, 1),
            ),
          ),
          SizedBox(height: spacing),
          Text(
            'Name the Dish Quiz',
            style: outfitBold.copyWith(
              fontSize: bigFontSize * 1.5,
              color: Colors.black,
            ),
          ),
          SizedBox(height: spacing * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard(
                context,
                'Questions',
                questions.toString(),
                cardWidth,
                cardHeight,
                backgroundColor: Color.fromRGBO(243, 239, 249, 1)
              ),
              _buildStatCard(
                context,
                'Played',
                played,
                cardWidth,
                cardHeight,
                backgroundColor:  Color.fromRGBO(188, 217, 255, 1)
              ),
              _buildStatCard(
                context,
                'Favorites',
                favorites.toString(),
                cardWidth,
                cardHeight,
                backgroundColor:  Color.fromRGBO(246, 223, 238, 1)
              ),
              _buildStatCard(
                context,
                'Points',
                points.toString(),
                cardWidth,
                cardHeight,
                backgroundColor:  Color.fromRGBO(255, 244, 223, 1)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      BuildContext context, String label, String value, double width, double height,
      {Color? backgroundColor}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.black, // Black border
          width: 2.0, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread of the shadow
            blurRadius: 5, // Blurriness of the shadow
            offset: Offset(3, 3), // Horizontal and vertical offset of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: outfitBold.copyWith(
              fontSize: getBigFontSize(context),
              color: Colors.black,
            ),
          ),
          SizedBox(height: getSpacing(context)),
          Text(
            label,
            style: outfitRegular.copyWith(
              fontSize: getFontSize(context),
              color: Colors.black
              ,
            ),
          ),
        ],
      ),
    );
  }
}
