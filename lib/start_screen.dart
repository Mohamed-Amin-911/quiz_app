import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(255, 5, 63, 92),
        ),
        const SizedBox(height: 30),
        Text('Learn flutter the fun way',
            style: GoogleFonts.lato(
                fontSize: 24,
                color: const Color.fromARGB(255, 5, 63, 92),
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 90),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                foregroundColor: const Color.fromARGB(255, 5, 63, 92)),
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('Start Quiz'))
      ],
    ));
  }
}
