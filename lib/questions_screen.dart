import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex =
      0; // this variable will hold the current index of the question initially top zeroth index

  // This function will handle the button click for the answers.
  void click() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        print("Quiz completed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Creating this variable that will automatically handle the question and answers change because of state.
    var currentQuestion = questions[currentQuestionIndex];
    return GradientContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: TextStyle(
              color: Color.fromARGB(255, 213, 216, 223),
              fontSize: 30,
            ),
          ),
          ...currentQuestion.answers.map((answer) {
            return AnswerButton(label: answer, clicked: click);
          })
        ],
      ),
    );
  }
}
