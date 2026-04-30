import 'package:hive_flutter/hive_flutter.dart';
class ToDoDataBase {
  final Box _myBox;
  List todoList = [];

  ToDoDataBase(this._myBox);
  
  //load the data from database
  void loadData() {
    todoList = _myBox.get('TODOLIST') ?? [];
  }

  //update the database
  void updateDataBase() {
    _myBox.put('TODOLIST', todoList);
  }
}