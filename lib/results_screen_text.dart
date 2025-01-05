import 'package:flutter/material.dart';

class ResultsScreenText extends StatelessWidget {
  ResultsScreenText(
      {required this.text,
      required this.color,
      required this.fontSize,
      this.weight,
      super.key});

  var text;
  List color;
  var fontSize;
  FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(color[0], color[1], color[2], color[3]),
        fontSize: fontSize,
        fontWeight: weight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
