import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planner/controller/day_controller.dart';
import 'package:planner/controller/month_controller.dart';
import 'package:planner/controller/week_controller.dart';
import 'package:planner/model/db.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/pages/day.dart';
import 'package:planner/view/pages/month.dart';
import 'package:planner/view/pages/week.dart';
import 'package:planner/view/styles.dart';
import 'package:planner/view/widgets/add_task.dart';
import 'package:planner/view/widgets/rendom_task.dart';
import 'package:planner/view/widgets/spacers.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var view = RM.inject(() => ViewController());
var viewController = view.state;

var week = RM.inject(() => WeekController());
var weekController = week.state;

var month = RM.inject(() => MonthController());
var monthController = month.state;

var day = RM.inject(() => DayController());
var dayController = day.state;

class ViewController {
  DateTime today = DateTime.now();

  TasksDB tasksDB = TasksDB();

  ThemeData theme = Styles().lightTheme;

  List<Widget> sections = [
    const Day(),
    const Week(),
    const Month(),
  ];

  List<Task> tasks = [];
  late Task randomTask;

  TextEditingController taskTextFieldController = TextEditingController();
  TextEditingController detailsTextFieldController = TextEditingController();

  FocusNode taskTextFieldFocus = FocusNode();
  FocusNode detailsTextFieldFocus = FocusNode();

  DateTime? dateTextFieldValue;
  TimeOfDay? timeTextFieldValue;

  void setTaskDateValue(DateTime date) {
    dateTextFieldValue = date;
    view.notify();
  }

  void setTaskTimeValue(TimeOfDay time) {
    timeTextFieldValue = time;
    view.notify();
  }

  void notifyAll() {
    day.notify();
    week.notify();
    month.notify();
    view.notify();
  }

  void getTasks() async {
    // Ensure that the database is initialized before running the app
    await tasksDB.initDatabase();

    // Retrieve all tasks from the database and assign to variable
    tasks = await tasksDB.getTasks() ?? <Task>[];
    notifyAll();
  }

  void getRandomTask() {
    final random = Random();
    List<Task> filteredTasks = tasks
        .where((Task task) => task.date == null && task.time == null)
        .toList();
    randomTask = filteredTasks[random.nextInt(filteredTasks.length)];
    view.notify();
  }

  void addTask(Task task) async {
    await tasksDB.addTask(task);
    getTasks(); //refresh tasks
  }

  void deleteTask(Task task) async {
    await tasksDB.deleteTask(task.id);
    getTasks(); //refresh tasks
  }

  void openView(Widget selectedView) {
    if (selectedView.runtimeType == const Week().runtimeType) {
      weekController.weekdayExpanded = true;
    } else {
      sections = <Widget>[selectedView];
    }
    notifyAll();
  }

  void closeView(Widget selectedView) {
    if (selectedView.runtimeType == const Week().runtimeType) {
      weekController.weekdayExpanded = false;
    } else {
      sections = <Widget>[
        const Day(),
        const Week(),
        const Month(),
      ];
    }
    notifyAll();
  }

  void showAddTaskModal(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => const AddTask(),
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacers.mediumSize),
        ),
      );

  void showRandomTask(BuildContext context) {
    getRandomTask();
    showDialog(
      context: context,
      builder: (context) => RandomTask(
        task: randomTask,
      ),
    );
  }
}
