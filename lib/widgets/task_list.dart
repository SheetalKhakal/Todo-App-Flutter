import 'package:flutter/cupertino.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TaskList extends StatelessWidget
{
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData, child){
        return ListView.builder(itemBuilder: (context,index)
        {
          final task = taskData.tasks[index];
          return TaskTile(isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (checkboxState) {
               taskData.updateTask(task);
            },
            longPressCallback: (){
            taskData.deleteTask(task);
            },
          );

        },
            itemCount: taskData.taskCount,
        );
      },

    );
  }
}
