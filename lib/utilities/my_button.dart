import 'package:flutter/material.dart';
import 'package:todoapp/utilities/colors.dart';
class myButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const myButton({super.key,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}