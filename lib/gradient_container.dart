import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: child,
      ),
    ));
  }
}
