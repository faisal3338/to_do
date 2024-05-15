import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/data/database.dart';

import 'package:to_do/util/dialog_box.dart';
import 'package:to_do/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//3- reference the hive box
  final _myBox = Hive.box('mybox');
  //4- create new Foloder for example "data", than create database.dart file
//------------------------------------------------------------------------------
  //9- make object from database class
  ToDoDataBase db = ToDoDataBase();

  //13
  @override
  void initState() {
    //13- if this the first time ever openin the app, than create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //14- there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //8- delete this list
  // List<List<dynamic>> toDoList = [
  //   ["Make Tutorial", false],
  //   ["Do Exercise", false]
  // ];

  // Checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value ?? false; // Update completion status.
    });
    //15- update database
    db.updateDateBase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    //16- update database
    db.updateDateBase();
  }

  //create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    //17- update database
    db.updateDateBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        // backgroundColor: Colors.green.shade300,
        title: const Text("TO DO List"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (Context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          // backgroundColor: Colors.green.shade500,
          onPressed: () {
            createNewTask();
          },
          label: const Text(
            "Add new Task",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          )),
    );
  }
}
