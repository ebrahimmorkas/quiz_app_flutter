import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({required this.label, required this.clicked, super.key});

  VoidCallback clicked;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: clicked,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 2, 16, 82),
              foregroundColor: Color.fromARGB(226, 214, 239, 245),
              padding: EdgeInsets.only(
                  left: 30, top: 20.0, right: 30, bottom: 20.0)),
          child: Text(label),
        ),
      ),
    );
  }
}
