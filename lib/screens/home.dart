import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplytasks/screens/introduction.dart';
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

  saveTasks() {
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
        onTap: () => tapTask(task),
        leading:
            Icon(task.done ? Icons.check_box : Icons.check_box_outline_blank),
        title: task.task.length > 0 ? Text(task.task) : buildInput(task),
      ),
    );
  }

  buildInput(Task task) {
    return TextField(
      autofocus: true,
      onSubmitted: (text) => saveTask(task, text),
      decoration:
          InputDecoration(border: InputBorder.none, hintText: "Text eingeben"),
    );
  }

  buildAddButton() {
    return Card(
      elevation: 3,
      child: ListTile(
        onTap: () {
          setState(() {
            tasks.add(Task(task: ""));
            saveTasks();
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
      "Tour starten"
    ], functions: [
      () => showCode(),
      () => clearList(),
      () => downloadApp(),
      () => openIntroduction()
    ]);
  }

  tapTask(Task task) {
    setState(() {
      if (task.task.length > 0) task.done = !task.done;
    });
    Timer(Duration(milliseconds: 1500), () {
      if (task.done)
        setState(() {
          tasks.remove(task);
          saveTasks();
        });
    });
  }

  saveTask(Task task, String text) {
    setState(() {
      if (text.length <= 0)
        tasks.remove(task);
      else
        task.task = text;
    });
    saveTasks();
  }

  showCode() {
    OpenUrl.open("https://github.com/laurensk/simplytasks_app");
  }

  clearList() {
    AlertUtils.resetConfirmation(context, (confirm) {
      if (!confirm) return;
      setState(() {
        tasks = [];
        saveTasks();
      });
    });
  }

  downloadApp() {
    OpenUrl.downloadApp(context);
  }

  openIntroduction() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Introduction(
          current: 0,
        ),
      ),
    );
  }
}
