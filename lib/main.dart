import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/gradient_container.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return GradientContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(232, 236, 220, 220),
          ),
          SizedBox(height: 80),
          Text(
            "Quiz App in Flutter",
            style: TextStyle(
              color: Color.fromARGB(255, 152, 203, 210),
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuestionsScreen()));
            },
            label: Text('Start Quiz'),
            style: OutlinedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 231, 240, 233)),
          )
        ],
      ),
    );
  }
}
