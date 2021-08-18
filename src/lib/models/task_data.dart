import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class TaskData extends ChangeNotifier {
  int countCompletedTask = 0;

  List<Task> tasks = [
    Task(
      name: 'Meet friend',
      id: uuid.v1(),
    ),
    Task(
      name: 'Go to gym',
      id: uuid.v1(),
    ),
    Task(
      name: 'Meal the dog',
      id: uuid.v1(),
    ),
  ];

  //check task id is null ?
  bool checkTaskId(String? taskId) {
    return taskId == null;
  }

  //check task có tồn tại trong list không
  bool checkExistTask(String? taskId) {
    final int count = tasks.length;
    tasks = [...tasks]..removeWhere((t) => t.id == taskId);

    return tasks.length != count;
  }

  void addTask(String newTaskText) {
    final task = Task(
      name: newTaskText,
      id: uuid.v1(),
    );

    tasks = [...tasks]..insert(0, task);
    notifyListeners();
  }

  bool upgradeTask(Task task) {
    if (checkTaskId(task.id)) {
      return false;
    }
    if (!checkExistTask(task.id)) {
      return false;
    }
    //nếu task chưa check done thì khi bị check done
    //thì sẽ chuyển xuống cuối list. Ngược lại, khi task
    //bị check done rồi khi bị check undone thì sẽ di
    //chuyển lên trên đầu list
    final Task updatedTask;
    if (task.isDone == false) {
      updatedTask = task.copyWith(isDone: true);
      tasks = [...tasks]..add(updatedTask);
    } else {
      updatedTask = task.copyWith(isDone: false);
      tasks = [...tasks]..insert(0, updatedTask);
    }

    notifyListeners();
    return true;
  }

  bool deleteTask(String? taskId) {
    if (checkTaskId(taskId)) {
      return false;
    }
    if (!checkExistTask(taskId)) {
      return false;
    }
    notifyListeners();
    return true;
  }
}
