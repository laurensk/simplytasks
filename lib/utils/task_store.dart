class Task {
  String task;
  bool done = false;

  Task({this.task});

  Task.fromJson(Map<String, dynamic> json) {
    task = json["task"];
  }
}

class TaskStore {
  add(Task task) {}

  remove(Task task) {}
}
