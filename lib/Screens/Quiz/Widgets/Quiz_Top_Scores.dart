// import 'package:flutter/material.dart';
// import '../../../Utils/app_constants.dart'; // Assuming this contains responsiveness utilities

// class TopScoresWidget extends StatelessWidget {
//   final List<Map<String, String>> scores = [
//     {
//       "rank": "1",
//       "name": "Kamran Ali",
//       "score": "20/20",
//       "time": "12 Mins 13 Secs",
//       "imagePath": "assets/images/kamran.png"
//     },
//     {
//       "rank": "2",
//       "name": "Toba Akbar",
//       "score": "20/20",
//       "time": "13 Mins 05 Secs",
//       "imagePath": "assets/images/toba.png"
//     },
//     {
//       "rank": "3",
//       "name": "Sameer",
//       "score": "19/20",
//       "time": "13 Mins 30 Secs",
//       "imagePath": "assets/images/sameer.png"
//     },
//     {
//       "rank": "4",
//       "name": "Fatima",
//       "score": "18/20",
//       "time": "12 Mins 13 Secs",
//       "imagePath": "assets/images/fatima.png"
//     },
//     {
//       "rank": "5",
//       "name": "Samira",
//       "score": "18/20",
//       "time": "13 Mins 24 Secs",
//       "imagePath": "assets/images/samira.png"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double fontSize = getFontSize(context);
//     double bigFontSize = getBigFontSize(context);

//     return Padding(
//       padding: const EdgeInsets.all(16.0), // Apply padding to the whole widget
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Top Scores',
//                 style: outfitBold.copyWith(
//                   fontSize: bigFontSize * 1.2,
//                   color: Colors.black,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Implement your functionality here
//                 },
//                 child: Text(
//                   'Scores',
//                   style: outfitBold.copyWith(
//                     fontSize: bigFontSize,
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: getSpacing(context) * 2),
//           ListView.separated(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(), // Disable scrolling as it will be in Column
//             itemCount: scores.length,
//             separatorBuilder: (context, index) => Divider(),
//             itemBuilder: (context, index) {
//               final score = scores[index];
//               return _buildScoreRow(
//                 context,
//                 rank: score['rank']!,
//                 name: score['name']!,
//                 scoreValue: score['score']!,
//                 time: score['time']!,
//                 imagePath: score['imagePath']!,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScoreRow(
//     BuildContext context, {
//     required String rank,
//     required String name,
//     required String scoreValue,
//     required String time,
//     required String imagePath,
//   }) {
//     double fontSize = getFontSize(context);
//     double bigFontSize = getBigFontSize(context);

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text(
//               rank,
//               style: outfitBold.copyWith(
//                 fontSize: bigFontSize,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(width: 10),
//             CircleAvatar(
//               radius: 20, // Set radius for the avatar
//               backgroundImage: AssetImage(imagePath),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: outfitBold.copyWith(
//                     fontSize: fontSize * 1.2,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   'Time: $time',
//                   style: outfitRegular.copyWith(
//                     fontSize: fontSize,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Text(
//           scoreValue,
//           style: outfitBold.copyWith(
//             fontSize: fontSize * 1.2,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
// File: lib/Screens/Quiz/Widgets/Quiz_Top_Scores.dart

import 'package:flutter/material.dart';
import '../../../Models/Quiz/quiz.dart';
import '../../../Utils/app_constants.dart'; // Assuming this contains responsiveness utilities

class TopScoresWidget extends StatelessWidget {
  final List<TopScore> topScores;

  const TopScoresWidget({required this.topScores, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = getFontSize(context);
    double bigFontSize = getBigFontSize(context);

    return Padding(
      padding: const EdgeInsets.all(16.0), // Apply padding to the whole widget
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Scores',
            style: outfitBold.copyWith(
              fontSize: bigFontSize * 1.2,
              color: Colors.black,
            ),
          ),
          SizedBox(height: getSpacing(context) * 2),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable scrolling as it will be in Column
            itemCount: topScores.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final score = topScores[index];
              return _buildScoreRow(
                context,
                rank: (index + 1).toString(),
                name: score.childName,
                scoreValue: score.score,
                time: score.timeTaken,
                imagePath: score.childImage,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScoreRow(
    BuildContext context, {
    required String rank,
    required String name,
    required String scoreValue,
    required String time,
    required String imagePath,
  }) {
    double fontSize = getFontSize(context);
    double bigFontSize = getBigFontSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              rank,
              style: outfitBold.copyWith(
                fontSize: bigFontSize,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20, // Set radius for the avatar
              backgroundImage: NetworkImage(imagePath), // Use NetworkImage if image is from URL
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: outfitBold.copyWith(
                    fontSize: fontSize * 1.2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Time: $time',
                  style: outfitRegular.copyWith(
                    fontSize: fontSize,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          scoreValue,
          style: outfitBold.copyWith(
            fontSize: fontSize * 1.2,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
