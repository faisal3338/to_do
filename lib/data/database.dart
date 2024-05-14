import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  //5- reference our box
  final _myBox = Hive.box('mybox');

  //6-make list to save data in this list
  List toDoList = [];

  //10- run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Study ", false]
    ];
  }

  //11- load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //12- update the database
  void updateDateBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
