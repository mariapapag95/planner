import 'package:flutter/material.dart';
import 'package:planner/model/db.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/week_state.dart';
import 'package:planner/view/pages/day.dart';
import 'package:planner/view/pages/month.dart';
import 'package:planner/view/pages/week.dart';
import 'package:planner/view/styles.dart';
import 'package:planner/view/widgets/add_task.dart';
import 'package:planner/view/widgets/rendom_task.dart';
import 'package:planner/view/widgets/spacers.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'day_state.dart';

var view = RM.inject(() => ViewState());
var viewState = view.state;

class ViewState {
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

  void getTasks() async {
    // Ensure that the database is initialized before running the app
    await tasksDB.initDatabase();

    // Retrieve all tasks from the database and assign to variable
    tasks = await tasksDB.getTasks() ?? <Task>[];
    print('get tasks called');
    view.notify();
    day.notify();
  }

  void getRandomTask() {
    randomTask = tasks
        .where((Task task) => task.date == null && task.time == null)
        .toList()
        .elementAt(
          int.parse(
            DateTime.now().millisecondsSinceEpoch.toString()[3],
          ),
        );
    view.notify();
  }

  void addTask(Task task) async {
    await tasksDB.addTask(task);
    getTasks(); //refresh tasks
  }

  void openView(Widget selectedView) {
    if (selectedView.runtimeType == const Week().runtimeType) {
      weekState.weekdayExpanded = true;
    } else {
      sections = <Widget>[selectedView];
    }
    view.notify();
  }

  void closeView(Widget selectedView) {
    if (selectedView.runtimeType == const Week().runtimeType) {
      weekState.weekdayExpanded = false;
    } else {
      sections = <Widget>[
        const Day(),
        const Week(),
        const Month(),
      ];
    }
    view.notify();
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
    getTasks(); //refresh tasks
    getRandomTask();
    showDialog(
      context: context,
      builder: (context) => RandomTask(
        task: randomTask,
      ),
    );
  }
}
