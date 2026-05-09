import 'package:flutter/material.dart';

class dropDown extends StatelessWidget {

  final String selectedValue;
  final Function(String?) onChanged;

  const dropDown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),

      decoration: BoxDecoration(

        color: Colors.white.withValues(alpha: 0.15),

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.white24,
        ),
      ),

      child: DropdownButton<String>(

        value: selectedValue,

        dropdownColor: Colors.black87,

        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),

        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),

        underline: SizedBox(),

        isExpanded: true,

        items: [

          DropdownMenuItem(
            value: "Low",
            child: Text(
              "🟢 Low",
            ),
          ),

          DropdownMenuItem(
            value: "Medium",
            child: Text(
              "🟠 Medium",
            ),
          ),

          DropdownMenuItem(
            value: "High",
            child: Text(
              "🔴 High",
            ),
          ),

        ],

        onChanged: onChanged,
      ),
    );
  }
}