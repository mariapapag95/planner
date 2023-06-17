import 'package:flutter/material.dart';
import 'package:planner/pages/day.dart';
import 'package:planner/pages/month.dart';
import 'package:planner/pages/week.dart';
import 'package:planner/state/week_state.dart';
import 'package:planner/styles.dart';
import 'package:planner/task_model.dart';
import 'package:planner/widgets/add_task.dart';
import 'package:planner/widgets/rendom_task.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var view = RM.inject(() => ViewState());
var viewState = view.state;

class ViewState {
  ThemeData theme = Styles().lightTheme;
  List<Widget> sections = [
    Day(),
    Week(),
    Month(),
  ];

  List<Task> tasks = [];
  late Task randomTask;

  TextEditingController taskTextFieldController = TextEditingController();
  TextEditingController detailsTextFieldController = TextEditingController();
  TextEditingController dateTextFieldController = TextEditingController();
  TextEditingController timeTextFieldController = TextEditingController();

  FocusNode taskTextFieldFocus = FocusNode();
  FocusNode detailsTextFieldFocus = FocusNode();
  FocusNode dateTextFieldFocus = FocusNode();
  FocusNode timeTextFieldFocus = FocusNode();

  void getTasks() {
    // Change to local JSON
    // tasks =
    view.notify();
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

  void addTask(Task task) {
    // TODO: Add to data (json?/SQLite?)
    view.notify();
  }

  void openView(Widget selectedView) {
    if (selectedView.runtimeType == Week().runtimeType) {
      weekState.weekdayExpanded = true;
    } else {
      sections = <Widget>[selectedView];
    }
    view.notify();
  }

  void closeView(Widget selectedView) {
    if (selectedView.runtimeType == Week().runtimeType) {
      weekState.weekdayExpanded = false;
    } else {
      sections = <Widget>[
        Day(),
        Week(),
        Month(),
      ];
    }
    view.notify();
  }

  void showAddTaskModal(BuildContext context) =>
      showModalBottomSheet(context: context, builder: (context) => AddTask());

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
