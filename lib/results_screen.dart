import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/questions.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({required this.selectedAsnwers, super.key});

  List<String> selectedAsnwers;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(questions[index].question),
              Text(questions[index].answers[0]),
              Text(selectedAsnwers[index]),
            ],
          );
        },
        itemCount: selectedAsnwers.length,
      ),
    );
  }
}
