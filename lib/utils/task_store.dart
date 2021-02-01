import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Task {
  String task;
  bool done = false;

  Task({this.task});

  Task.fromJson(Map<String, dynamic> json) {
    task = json["task"];
  }

  static Map<String, dynamic> toMap(Task task) =>
      {'task': task.task, 'done': task.done};

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
      );

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item))
          .toList();
}

class TaskStore {
  static Future<List<Task>> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('tasks') != null) {
      return Task.decode(prefs.getString('tasks'));
    }

    List<Task> tasks = [
      Task(task: "Planung der App"),
      Task(task: "Gestaltung der App"),
      Task(task: "Entwicklung der App"),
      Task(task: "Veröffentlichung der App"),
    ];
    saveTasks(tasks);
    return tasks;
  }

  static saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tasks", Task.encode(tasks));
  }
}
