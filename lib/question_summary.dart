import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data['chosen_Answer'] == data['correct_Answer']
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 138, 255, 142)),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 5, 63, 92),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 249, 88, 123)),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 5, 63, 92),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(data['question'] as String,
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 5, 63, 92),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlign: TextAlign.left),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(data['chosen_Answer'] as String,
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 242, 104, 122),
                                fontSize: 18),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(data['correct_Answer'] as String,
                            style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 57, 104, 113),
                                fontSize: 18),
                            textAlign: TextAlign.left),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
