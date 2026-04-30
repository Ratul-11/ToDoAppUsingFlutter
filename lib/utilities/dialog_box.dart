import 'package:flutter/material.dart';
import 'package:todoapp/utilities/colors.dart';
import 'package:todoapp/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        height:150,
        width: 150,
        decoration: BoxDecoration
        (gradient: mainGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //get user input
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
               border: OutlineInputBorder(),
              hintText: "Add a new task",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          //buttons -> save + cancel
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //save button
            myButton(text: "Save", onPressed: onSave),
            //delete button
            myButton(text: "Delete", onPressed: onCancel),
          ],
        )
        ],//children
      ),
    ),
    );
  }
}