import'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String priority;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

   const ToDoTile({super.key,
   required this.taskName,
   required this.taskCompleted,
   required this.onChanged,
   required this.deleteFunction,
   required this.priority
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
         child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(

  mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

  children: [

    Row(

      children: [

        Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
        ),

        Text(

          taskName,

          style: TextStyle(

            color: Colors.white,

            fontSize: 18,

            decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),

      ],
    ),

    Container(

      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      decoration: BoxDecoration(

        color:
            priority == "High"
                ? Colors.red
                : priority == "Medium"
                    ? Colors.orange
                    : Colors.green,

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Text(

        priority,

        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

  ],
),
        ),
      ),
    );
  }
}