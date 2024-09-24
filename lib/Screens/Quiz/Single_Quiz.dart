// import 'package:app/API/Bloc/Quiz/quiz_bloc.dart';
// import 'package:app/API/Bloc/Quiz/quiz_event.dart';
// import 'package:app/API/Bloc/Quiz/quiz_state.dart';
// import 'package:app/API/Repository/Quiz_Repo.dart';
// import 'package:app/Models/Quiz/Quiz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:async';

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int? selectedAnswerId;
//   bool isAnswered = false;
//   bool isCorrect = false;
//   int currentQuestionIndex = 0;
//   late QuizList quizzes;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Quiz')),
//       body: BlocProvider(
//         create: (context) =>
//             SingleQuizBloc(SingleQuizRepository())..add(FetchSingleQuiz(6)),
//         child: BlocBuilder<SingleQuizBloc, SingleQuizState>(
//           builder: (context, state) {
//             if (state is SingleQuizInitial || state is SingleQuizLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is SingleQuizLoaded) {
//               quizzes = state.quiz;
//               return buildQuizContent(quizzes.quizzes[currentQuestionIndex]);
//             } else if (state is SingleQuizError) {
//               return Center(child: Text('Failed to load quizzes'));
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildQuizContent(Quiz quiz) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           buildHeader(quiz),
//           SizedBox(height: 20),
//           buildQuizImage(),
//           SizedBox(height: 20),
//           Text(
//             'See the picture above and tell the name of the dish. Select name below.',
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 10),
//           buildAnswersList(quiz),
//           SizedBox(height: 20),
//           if (isAnswered) buildAnswerFeedback(quiz),
//         ],
//       ),
//     );
//   }

//   Widget buildHeader(Quiz quiz) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Icon(Icons.arrow_back),
//         Text('Name the Dish', style: TextStyle(fontWeight: FontWeight.bold)),
//         Row(
//           children: [
//             Icon(Icons.timer),
//             Text('00:15'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget buildQuizImage() {
//     // Placeholder for the image; you can replace this with actual network images
//     return Image.network(
//       'https://example.com/image.jpg',
//       height: 200,
//       width: double.infinity,
//       fit: BoxFit.cover,
//     );
//   }

//   Widget buildAnswersList(Quiz quiz) {
//     return Column(
//       children: quiz.answers.map((answer) {
//         return GestureDetector(
//           onTap: () {
//             if (!isAnswered) {
//               setState(() {
//                 selectedAnswerId = answer.id;
//                 isAnswered = true;
//                 isCorrect = selectedAnswerId == quiz.correctAnswer.id;
//               });

//               // Move to next question after a delay
//               Timer(Duration(seconds: 2), () {
//                 setState(() {
//                   if (currentQuestionIndex < quizzes.quizzes.length - 1) {
//                     currentQuestionIndex++;
//                     isAnswered = false;
//                     selectedAnswerId = null;
//                   } else {
//                     showCompletionDialog();
//                   }
//                 });
//               });
//             }
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black12),
//               borderRadius: BorderRadius.circular(10),
//               color: selectedAnswerId == answer.id
//                   ? (isCorrect ? Colors.green.shade100 : Colors.red.shade100)
//                   : Colors.white,
//             ),
//             child: ListTile(
//               title: Text(answer.answer),
//               trailing: selectedAnswerId == answer.id
//                   ? Icon(
//                       isCorrect ? Icons.check_circle : Icons.cancel,
//                       color: isCorrect ? Colors.green : Colors.red,
//                     )
//                   : null,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget buildAnswerFeedback(Quiz quiz) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             isCorrect ? Icons.check_circle : Icons.cancel,
//             color: isCorrect ? Colors.green : Colors.red,
//           ),
//           SizedBox(width: 10),
//           Text(
//             isCorrect
//                 ? 'Correct! Answer'
//                 : 'Wrong! Answer: ${quiz.correctAnswer.answer}',
//             style: TextStyle(
//               color: isCorrect ? Colors.green : Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showCompletionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Quiz Completed'),
//         content: Text('You have answered all the questions.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               // Reset quiz for another attempt or exit
//               setState(() {
//                 currentQuestionIndex = 0;
//                 isAnswered = false;
//                 selectedAnswerId = null;
//               });
//             },
//             child: Text('Restart'),
//           ),
//         ],
//       ),
//     );
//   }
// }
