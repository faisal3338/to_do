import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/theme/theme.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: Theme.of(context).brightness == Brightness.dark
                    ? [
                        Color.fromARGB(255, 84, 74, 125),
                        Color.fromARGB(255, 255, 212, 84),
                        // Color.fromARGB(255, 234, 7, 121),
                        // Color.fromARGB(255, 242, 41, 83),
                      ]
                    : [
                        Color.fromARGB(255, 80, 141, 246),
                        Color.fromARGB(255, 89, 186, 106),
                        // Color.fromARGB(255, 236, 56, 118),
                        // Color.fromARGB(255, 253, 239, 249),
                      ]),
            // color: Theme.of(context).brightness == Brightness.dark
            //     ? const Color.fromARGB(255, 234, 7, 121)
            //     : Colors.green.shade800
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),

              //task name
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 25,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
