// lib/Screens/Quiz/quiz_play.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/Bloc/Quiz/quiz_bloc.dart';
import '../../API/Bloc/Quiz/quiz_event.dart';
import '../../API/Bloc/Quiz/quiz_state.dart';

import '../../API/Repository/quiz_repo.dart';
import '../../Models/Quiz/quiz.dart';

class QuizPlayScreen extends StatefulWidget {
  final int quizId;
  final int childId; // Assuming you have the child ID available

  const QuizPlayScreen({
    required this.quizId,
    required this.childId,
    Key? key,
  }) : super(key: key);

  @override
  _QuizPlayScreenState createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int currentQuestionIndex = 0;
  int selectedAnswerId = -1; // To track selected answer
  bool isCorrectAnswer = false;
  bool answerSubmitted = false;
  Timer? _timer;
  int _elapsedTime = 0; // Total elapsed time in seconds

  late QuizDetailBloc _quizDetailBloc;
  late QuizSubmissionBloc _quizSubmissionBloc;

  // List to collect all answers
  List<AnswerSubmission> submittedAnswers = [];

  @override
  void initState() {
    super.initState();
    // Initialize the Blocs with the repository
    _quizDetailBloc = QuizDetailBloc(
      QuizDetailRepository(),
    )..add(FetchQuizDetail(widget.quizId));

    _quizSubmissionBloc = QuizSubmissionBloc(
      repository: QuizDetailRepository(),
    );

    _startTimer(); // Start the timer when the screen is loaded
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when leaving the screen
    _quizDetailBloc.close(); // Close the Blocs to free resources
    _quizSubmissionBloc.close();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += 1; // Increase elapsed time by 1 second
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
  }

  void _resumeTimer() {
    if (_timer == null || !_timer!.isActive) {
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _quizDetailBloc, // Provide the existing QuizDetailBloc instance
        ),
        BlocProvider.value(
          value: _quizSubmissionBloc, // Provide the existing QuizSubmissionBloc instance
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
        ),
        body: BlocListener<QuizSubmissionBloc, QuizSubmissionState>(
          listener: (context, state) {
            if (state is QuizSubmissionLoading) {
              // Show a loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is QuizSubmissionSuccess) {
              // Dismiss the loading indicator
              Navigator.of(context).pop();

              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Quiz submitted successfully!')),
              );

              // Navigate to the results screen
              final quizDetailState = _quizDetailBloc.state;
              if (quizDetailState is QuizDetailLoaded) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizResultsScreen(
                      quizDetail: quizDetailState.quizDetail,
                      totalTime: _elapsedTime,
                    ),
                  ),
                );
              }
            } else if (state is QuizSubmissionFailure) {
              // Dismiss the loading indicator
              Navigator.of(context).pop();

              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Submission failed: ${state.error}')),
              );

              // Optionally, allow the user to retry
              setState(() {
                answerSubmitted = false;
                selectedAnswerId = -1;
              });
            }
          },
          child: BlocBuilder<QuizDetailBloc, QuizDetailState>(
            builder: (context, state) {
              if (state is QuizDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuizDetailLoaded) {
                return _buildQuizContent(context, state.quizDetail);
              } else if (state is QuizDetailError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuizContent(BuildContext context, QuizDetail quizDetail) {
    // When the quiz is completed, trigger the submission
    if (currentQuestionIndex >= quizDetail.quizQuestion.length) {
      _pauseTimer(); // Stop the timer when quiz is completed
      _handleFinalSubmission();
      // Return a placeholder as the submission is being handled
      return const Center(child: Text('Submitting your quiz...'));
    }

    final currentQuestion = quizDetail.quizQuestion[currentQuestionIndex];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quiz Name and Question Number
            Text(
              quizDetail.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Question: ${currentQuestionIndex + 1}/${quizDetail.quizQuestion.length}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            // Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.timer, size: 18),
                const SizedBox(width: 4),
                Text(
                  '${_formatTime(_elapsedTime)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Question Image
            if (currentQuestion.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  currentQuestion.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image,
                          size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            // Question Text
            Text(
              'Question No ${currentQuestionIndex + 1}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(height: 8),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Answers
            ...currentQuestion.answer
                .map((answer) => _buildAnswerTile(
                    context, currentQuestion, answer, quizDetail))
                .toList(),
            const SizedBox(height: 16),
            // Feedback
            if (answerSubmitted)
              Row(
                children: [
                  Icon(
                    isCorrectAnswer ? Icons.check_circle : Icons.cancel,
                    color: isCorrectAnswer ? Colors.green : Colors.red,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCorrectAnswer
                        ? "Correct!"
                        : "Wrong! Answer: ${currentQuestion.correctAnswer.answer}",
                    style: TextStyle(
                      color: isCorrectAnswer ? Colors.green : Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerTile(BuildContext context, QuizQuestion currentQuestion,
      Answer answer, QuizDetail quizDetail) {
    return GestureDetector(
      onTap: answerSubmitted
          ? null // Disable tapping if answer is already submitted
          : () {
              setState(() {
                selectedAnswerId = answer.id;
                answerSubmitted = true;
                isCorrectAnswer =
                    answer.id == currentQuestion.correctAnswer.id;

                // Collect the selected answer
                submittedAnswers.add(
                  AnswerSubmission(
                    quizQuestionId: currentQuestion.id,
                    quizAnswerId: answer.id,
                  ),
                );
              });

              if (currentQuestionIndex + 1 < quizDetail.quizQuestion.length) {
                // Not the last question
                _handleAnswerSubmission();
              } else {
                // Last question, submit all answers
                _handleFinalSubmission();
              }
            },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _getAnswerColor(currentQuestion, answer),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(answer.answer, style: const TextStyle(fontSize: 16)),
            ),
            if (answerSubmitted && selectedAnswerId == answer.id)
              Icon(
                answer.id == currentQuestion.correctAnswer.id
                    ? Icons.check_circle
                    : Icons.cancel,
                color: answer.id == currentQuestion.correctAnswer.id
                    ? Colors.green
                    : Colors.red,
                size: 24,
              )
          ],
        ),
      ),
    );
  }

  Color _getAnswerColor(QuizQuestion currentQuestion, Answer answer) {
    if (!answerSubmitted) return Colors.white;
    if (selectedAnswerId == answer.id) {
      return answer.id == currentQuestion.correctAnswer.id
          ? Colors.green.withOpacity(0.3)
          : Colors.red.withOpacity(0.3);
    }
    return Colors.white;
  }

  void _handleAnswerSubmission() {
    // Show feedback, then move to the next question after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerId = -1;
          answerSubmitted = false;
          isCorrectAnswer = false;
          // Timer continues running; no need to reset
        });
      }
    });
  }

  void _handleFinalSubmission() {
    // Dispatch the submission event
    _quizSubmissionBloc.add(
      SubmitQuizEvent(
        childId: widget.childId,
        quizId: widget.quizId,
        answers: submittedAnswers,
      ),
    );
  }

  String _formatTime(int seconds) {
    final Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String secs = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$secs";
  }
}

// Placeholder for the QuizResultsScreen
class QuizResultsScreen extends StatelessWidget {
  final QuizDetail quizDetail;
  final int totalTime;

  const QuizResultsScreen({
    required this.quizDetail,
    required this.totalTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the results screen UI here
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "You completed the quiz in ${_formatTime(totalTime)}!",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: quizDetail.quizQuestion.length,
                itemBuilder: (context, index) {
                  final question = quizDetail.quizQuestion[index];
                  return ListTile(
                    title: Text(question.question),
                    subtitle:
                        Text("Correct Answer: ${question.correctAnswer.answer}"),
                    // Optionally, show user's answer and whether it was correct
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back or to another screen
                Navigator.pop(context);
              },
              child: const Text("Finish"),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String secs = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$secs";
  }
}
