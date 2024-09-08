import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
// ignore_for_file: prefer_const_constructors

class AddTaskScreen extends StatelessWidget
{
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    String newTaskTitle = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                print(newText);
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                   if (newTaskTitle.isNotEmpty) {
                     Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                   }
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white),
              child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}
