class Task {
  String task;
  bool done = false;

  Task({this.task});

  Task.fromJson(Map<String, dynamic> json) {
    task = json["task"];
  }
}

class TaskStore {
  static Future<List<Task>> getTasks() async {
    List<Task> tasks = [
      Task(task: "Build app"),
      Task(task: "Test app"),
      Task(task: "Release app")
    ];
    return tasks;
  }

  static safeTasks(List<Task> tasks) async {}
}
