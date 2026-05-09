import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final String priority;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 25.0,
      ),

      child: Slidable(

        endActionPane: ActionPane(

          motion: const StretchMotion(),

          children: [

            SlidableAction(

              onPressed: deleteFunction,

              icon: Icons.delete,

              backgroundColor: Colors.red,

              borderRadius:
                  BorderRadius.circular(12),
            ),

          ],
        ),

        child: Container(

          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(

            color:
                Colors.white.withValues(
                    alpha: 0.3),

            borderRadius:
                BorderRadius.circular(12),
          ),

          child: Row(

            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Expanded(

                child: Row(

                  children: [

                    Checkbox(

                      value: taskCompleted,

                      onChanged: onChanged,
                    ),

                    Expanded(

                      child: Text(

                        taskName,

                        softWrap: true,

                        style: TextStyle(

                          color: Colors.white,

                          fontSize: 18,

                          decoration:
                              taskCompleted
                                  ? TextDecoration
                                      .lineThrough
                                  : TextDecoration
                                      .none,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(width: 10),

              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(

                  color:
                      priority == "High"
                          ? Colors.red
                          : priority ==
                                  "Medium"
                              ? Colors.orange
                              : Colors.green,

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Text(

                  priority,

                  style: const TextStyle(

                    color: Colors.white,

                    fontWeight:
                        FontWeight.bold,
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