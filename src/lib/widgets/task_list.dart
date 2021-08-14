import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskList, _) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 5.0,
              color: Colors.black,
              thickness: 0.5,
            );
          },
          itemCount: taskList.tasks.length,
          itemBuilder: (context, index) {
            final task = taskList.tasks[index];
            return TaskTile(
              task: task,
              taskData: taskList,
            );
          },
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.taskData,
  }) : super(key: key);

  final Task task;
  final TaskData taskData;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () {
            taskData.deleteTask(task.id!);
          },
          icon: Icons.delete,
        )
      ],
      child: ListTile(
        title: Text(
          task.name!,
          style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: task.isDone,
          onChanged: (checkBoxState) {
            if (taskData.upgradeTask(task) == false) {
              final snackBar = SnackBar(
                content: Text('Something went wrong!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ),
    );
  }
}
