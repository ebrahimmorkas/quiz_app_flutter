import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen_text.dart';

class ResultsScreen extends StatefulWidget {
  ResultsScreen({required this.selectedAnswers, super.key});

  List<String> selectedAnswers;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int correctAnswers = 0;
  @override
  void initState() {
    super.initState();
    correctAnswers =
        widget.selectedAnswers.asMap().entries.fold(0, (count, entry) {
      final index = entry.key;
      final selectedAnswer = entry.value;
      return selectedAnswer == questions[index].answers[0] ? count + 1 : count;
    });
  }

  @override
  Widget build(BuildContext context) {
    // void updateCorrectAnswersVariable() {
    //   print("from function");
    //   setState(() {
    //     correctAnswers++;
    //   });
    // }

    return GradientContainer(
      child: Column(
        children: [
          ResultsScreenText(
            text: "You scored $correctAnswers",
            color: [255, 226, 218, 239],
            fontSize: 30,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ResultsScreenText(
                      text: questions[index].question,
                      color: [255, 226, 228, 234],
                      fontSize: 25,
                    ),
                    Row(
                      children: [
                        Icon(Icons.check),
                        SizedBox(width: 15),
                        ResultsScreenText(
                            text: questions[index].answers[0],
                            color: [255, 167, 172, 188],
                            fontSize: 20),
                      ],
                    ),
                    if (widget.selectedAnswers[index] !=
                        questions[index].answers[0])
                      Row(
                        children: [
                          Icon(Icons.close),
                          SizedBox(width: 15),
                          ResultsScreenText(
                              text: widget.selectedAnswers[index],
                              color: [255, 132, 139, 159],
                              fontSize: 20),
                        ],
                      )
                  ],
                );
              },
              itemCount: widget.selectedAnswers.length,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return QuestionsScreen();
                  },
                ));
              },
              child: Text("Restart"))
        ],
      ),
    );
  }
}

// class ResultsScreen extends StatelessWidget {
//   ResultsScreen({required this.selectedAnswers, super.key});

//   List<String> selectedAnswers;

//   @override
//   Widget build(BuildContext context) {
//     var correctAnswers = 0;

//     void updateCorrectAnswersVariable() {
//       setState(() {
//         correctAnswers++;
//       });
//     }

//     return GradientContainer(
//       child: Column(
//         children: [
//           Text("You scored $correctAnswers"),
//           ListView.builder(
//             itemBuilder: (context, index) {
//               // Checking the number of correct answers given by user
//               if(selectedAnswers[index] == questions[index].question)
//                 updateCorrectAnswersVariable();
//               return Column(
//                 children: [
//                   ResultsScreenText(
//                       text: questions[index].question,
//                       color: [255, 226, 228, 234],
//                       fontSize: 25),
//                   // Text(
//                   //   questions[index].question,
//                   //   style: TextStyle(color: Color.fromARGB(255, 226, 228, 234)),
//                   // ),
//                   Row(
//                     children: [
//                       Icon(Icons.check),
//                       SizedBox(width: 15),
//                       ResultsScreenText(
//                           text: questions[index].answers[0],
//                           color: [255, 167, 172, 188],
//                           fontSize: 20),
//                       // Text(
//                       //   questions[index].answers[0],
//                       //   style: TextStyle(color: Color.fromARGB(255, 167, 172, 188)),
//                       // ),
//                     ],
//                   ),
//                   if (selectedAnswers[index] != questions[index].answers[0])
//                     Row(
//                       children: [
//                         Icon(Icons.close),
//                         SizedBox(width: 15),
//                         ResultsScreenText(
//                             text: selectedAnswers[index],
//                             color: [255, 132, 139, 159],
//                             fontSize: 20),
//                       ],
//                     )

//                   // Text(
//                   //   selectedAsnwers[index],
//                   //   style: TextStyle(color: Color.fromARGB(255, 132, 139, 159)),
//                   // ),
//                 ],
//               );
//             },
//             itemCount: selectedAnswers.length,
//           ),
//         ],
//       ),
//     );
//   }
// }
