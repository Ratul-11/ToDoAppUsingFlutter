import 'package:flutter/material.dart';
import 'package:todoapp/utilities/colors.dart';
import 'package:todoapp/utilities/my_button.dart';
import 'package:todoapp/utilities/dropdown.dart';

class DialogBox extends StatefulWidget {

  final controller;
  final Function(String) onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {

  String selectedPriority = "Low";

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      contentPadding: EdgeInsets.all(0),

      content: Container(

        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          gradient: mainGradient,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            // text field
            TextField(

              controller: widget.controller,

              style: TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(

                border: OutlineInputBorder(),

                hintText: "Add a new task",

                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(height: 20),

            // dropdown
            dropDown(

              selectedValue: selectedPriority,

              onChanged: (value) {

                setState(() {

                  selectedPriority = value!;

                });

              },

            ),

            SizedBox(height: 20),

            // buttons
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                myButton(
                  text: "Save",
                  onPressed: () {
                    widget.onSave(selectedPriority);
                  },
                ),

                myButton(
                  text: "Delete",
                  onPressed: widget.onCancel,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}