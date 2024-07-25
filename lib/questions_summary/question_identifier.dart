import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.isCorrectAnswer, required this.questionIndex, super.key});

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(right: 10), // Adjust margin as needed
      child: CircleAvatar(
        backgroundColor: isCorrectAnswer
            ? const Color.fromARGB(255, 20, 136, 142)
            : const Color.fromARGB(255, 214, 33, 20),
        radius: 16, // Adjust the size of the circle
        child: Text(
          (questionIndex + 1).toString(), // Display the question number
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
