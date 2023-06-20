import 'package:planner/model/task_model.dart';
import 'package:planner/state/day_state.dart';
import 'package:planner/state/view_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var week = RM.inject(() => WeekState());
var weekState = week.state;

class WeekState {
  DateTime today = DateTime.now();

  DateTime get monthEnd => DateTime(today.year, today.month + 1, 0);
  int firstDayOfMonth = 0;

  List<Task> get toDo => viewState.tasks
      .where((Task task) =>
          (task.date ?? DateTime.now()).isAtSameMomentAs(thisWeek.first) ||
          (task.date ?? DateTime.now()).isAtSameMomentAs(thisWeek.last) ||
          (task.date ?? DateTime.now()).isAfter(thisWeek.first) &&
              (task.date ?? DateTime.now()).isBefore(thisWeek.last))
      .toList();

  bool weekdayExpanded = false;

  List<DateTime> get thisWeek {
    List<DateTime> days = List.generate(
      monthEnd.day - today.day + 1,
      (index) => DateTime(today.year, today.month, today.day + index),
    );
    if (days.length < 7) {
      days.addAll(
        List.generate(
          7 - days.length,
          (index) => DateTime(
            (weekState.today.month == 12
                ? weekState.today.year + 1
                : weekState.today.year),
            weekState.today.month + 1,
            firstDayOfMonth + index,
          ),
        ),
      );
    }
    return days;
  }

  int get weekStart =>
      dayState.today.day -
      (dayState.today.weekday == 7 ? 0 : dayState.today.weekday);
}
