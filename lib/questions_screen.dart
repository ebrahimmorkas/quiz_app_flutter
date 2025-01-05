import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex =
      0; // this variable will hold the current index of the question initially top zeroth index

  List<String> selectedAnswers =
      []; // This is the list that will hold the questions selected by the user.

  @override
  Widget build(BuildContext context) {
    // This function will handle the button click for the answers.
    void click(String answer) {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          selectedAnswers.add(answer);
          currentQuestionIndex++;
        } else {
          print("Quiz completed");
          selectedAnswers.add(answer);
          print(selectedAnswers);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultsScreen(selectedAnswers: selectedAnswers)));
        }
      });
    }

    // Creating this variable that will automatically handle the question and answers change because of state.
    var currentQuestion = questions[currentQuestionIndex];

    List<String> currentQuestionAnswersList = [];

    currentQuestionAnswersList = List.from(currentQuestion.answers);
    currentQuestionAnswersList.shuffle();

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
          ...currentQuestionAnswersList.map((answer) {
            return AnswerButton(
                label: answer,
                clicked: () {
                  click(answer);
                });
          })
        ],
      ),
    );
  }
}
