import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utilities/colors.dart';
import 'package:todoapp/utilities/todo_tile.dart';
import 'package:todoapp/utilities/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final Box _myBox;
  late final ToDoDataBase db;

  @override
  void initState() {

    super.initState();

    _myBox = Hive.box('mybox');



    db = ToDoDataBase(_myBox);

    db.loadData();
  }

  // text controller
  final _controller = TextEditingController();

  // save new task
  void saveNewTask(String priority) {

    setState(() {

      db.todoList.add([
        _controller.text,
        false,
        priority,
      ]);

    });

    _controller.clear();

    Navigator.of(context).pop();

    db.updateDataBase();
  }

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {

    setState(() {

      db.todoList[index][1] =
          !db.todoList[index][1];

    });

    db.updateDataBase();
  }

  // delete task
  void deleteTask(int index) {

    setState(() {

      db.todoList.removeAt(index);

    });

    db.updateDataBase();
  }
  void editTask(int index) {

  // put old task text into textbox
  _controller.text =
      db.todoList[index][0];

  showDialog(

    context: context,

    builder: (context) {

      return DialogBox(

        controller: _controller,

        onSave: (priority) {

          setState(() {

            // update existing task
            db.todoList[index] = [

              _controller.text,

              db.todoList[index][1],

              priority,

            ];

          });

          // clear textbox
          _controller.clear();

          // close dialog
          Navigator.of(context).pop();

          // save to Hive
          db.updateDataBase();
        },

        onCancel: () {

          _controller.clear();

          Navigator.of(context).pop();

        },
      );
    },
  );
}

  // create new task
  void createNewTask() {

    showDialog(

      context: context,

      builder: (context) {

        return DialogBox(

          controller: _controller,

          onSave: (priority) {

            saveNewTask(priority);

          },

          onCancel: () =>
              Navigator.of(context).pop(),

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBodyBehindAppBar: true,

      appBar: AppBar(

        title: const Text(
          "To Do",

          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor:
            Colors.black.withOpacity(0.3),

        elevation: 0,

        centerTitle: true,
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: createNewTask,

        child: const Icon(Icons.add),
      ),

      body: Container(

        height: double.infinity,

        width: double.infinity,

        decoration: BoxDecoration(
          gradient: mainGradient,
        ),

        child: ListView.builder(

          itemCount: db.todoList.length,

          itemBuilder:
              (BuildContext context, int index) {

            return ToDoTile(

              taskName: db.todoList[index][0],

              taskCompleted:
                  db.todoList[index][1],

              priority:
                  db.todoList[index][2],

              onChanged: (value) =>
                  checkBoxChanged(
                      value, index),

              deleteFunction: (context) =>
                  deleteTask(index),

              onEdit: () {
                    editTask(index);
                  },
            );
          },
        ),
      ),
    );
  }
}