import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 5, 63, 92),
            foregroundColor: Colors.white),
        child: Text(answerText, textAlign: TextAlign.center));
  }
}
