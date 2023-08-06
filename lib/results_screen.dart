import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, {super.key});
  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Answer': questions[i].answers[0],
        'chosen_Answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final gettSummary = getSummary();
    final totQuestions = questions.length;
    final totCorrect = gettSummary.where((data) {
      return data['chosen_Answer'] == data['correct_Answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  Text(
                      'You correctly answered $totCorrect out of $totQuestions questions',
                      style: GoogleFonts.lato(
                          color: Color.fromARGB(255, 51, 0, 70),
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  QuestionSummary(gettSummary),
                  const SizedBox(height: 30),
                  OutlinedButton.icon(
                      onPressed: () {
                        restartQuiz();
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          foregroundColor:
                              const Color.fromARGB(255, 5, 63, 92)),
                      icon: const Icon(Icons.restart_alt_outlined),
                      label: const Text('Restart Quiz'))
                ])));
  }
}
