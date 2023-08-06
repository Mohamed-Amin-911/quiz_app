import 'package:flutter/material.dart';
import 'package:quiz_app/question_button_style.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var curQuestIndex = 0;
  void answerQuest(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      curQuestIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuest = questions[curQuestIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuest.text,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 5, 63, 92),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ...currentQuest.getShuffledAnswers().map((item) {
                return QuestionButton(item, () {
                  answerQuest(item);
                });
              }),
            ]),
      ),
    );
  }
}
