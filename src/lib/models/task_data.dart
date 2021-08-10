import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Meet friend'),
    Task(name: 'Go to gym'),
    Task(name: 'Meal the dog'),
  ];

  void addTask(String newTaskText) {
    final task = Task(name: newTaskText);
    tasks.add(task);
    notifyListeners();
  }

  void upgradeTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
