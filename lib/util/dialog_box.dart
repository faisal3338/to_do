import 'package:flutter/material.dart';
import 'package:to_do/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade200,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Add Task Name",
              ),
            ),

            //save cancel
            Row(
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 8,
                ),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
