import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplytasks/utils/alert_utils.dart';
import 'package:simplytasks/utils/open_url.dart';
import 'package:simplytasks/utils/task_store.dart';
import 'package:simplytasks/widgets/button_group.dart';
import 'package:simplytasks/widgets/custom_scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [];

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  getTasks() async {
    var tasks = await TaskStore.getTasks();
    setState(() {
      this.tasks = tasks;
    });
  }

  safeTasks() {
    print("im gonne safe now!");
    TaskStore.saveTasks(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Simplytasks",
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              for (Task task in tasks) buildTask(task),
              buildAddButton(),
              buildButtonGroup()
            ],
          ),
        ),
      ),
    );
  }

  buildTask(Task task) {
    return Card(
      elevation: 3,
      child: ListTile(
        onTap: () {
          setState(() {
            task.done = !task.done;
          });
          Timer(Duration(milliseconds: 1500), () {
            if (task.done)
              setState(() {
                tasks.remove(task);
                safeTasks();
              });
          });
        },
        leading:
            Icon(task.done ? Icons.check_box : Icons.check_box_outline_blank),
        title: Text(task.task),
      ),
    );
  }

  buildAddButton() {
    return Card(
      elevation: 3,
      child: ListTile(
        onTap: () {
          setState(() {
            tasks.add(Task(task: "New task"));
            safeTasks();
          });
        },
        leading: Icon(Icons.add),
        title: Text(
          'Task erstellen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  buildButtonGroup() {
    return ButtonGroup(titles: [
      "Code ansehen",
      "Liste leeren",
      "App herunterladen",
      "Einführung ansehen"
    ], functions: [
      () => showCode(),
      () => clearList(),
      () => downloadApp(),
      () => openIntroduction()
    ]);
  }

  showCode() {
    OpenUrl.open("https://github.com/laurensk/simplytasks_app");
  }

  clearList() {
    AlertUtils.resetConfirmation(context, (confirm) {
      if (!confirm) return;
      setState(() {
        tasks = [];
        safeTasks();
      });
    });
  }

  downloadApp() {
    OpenUrl.downloadApp(context);
  }

  openIntroduction() {}
}
