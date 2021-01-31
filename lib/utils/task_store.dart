class Task {
  int id;
  String task;

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    task = json["task"];
  }
}

class TaskStore {
  add(Task task) {}

  remove(Task task) {}
}
