import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        //selectedAnswers = [];
      });
    }
  }

  void resetQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    var screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(chooseAnswer);
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers, resetQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 159, 231, 245),
                Color.fromARGB(255, 66, 158, 189)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
