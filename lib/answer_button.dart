import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({required this.label, required this.clicked, super.key});

  VoidCallback clicked;
  String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: clicked, child: Text(label));
  }
}
