import 'package:planner/model/task_model.dart';
import 'package:planner/state/view_controller.dart';

class WeekController {
  DateTime today = DateTime.now();

  DateTime get monthEnd => DateTime(today.year, today.month + 1, 0);
  int firstDayOfMonth = 0;

  List<Task> get toDo => viewController.tasks
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
            (weekController.today.month == 12
                ? weekController.today.year + 1
                : weekController.today.year),
            weekController.today.month + 1,
            firstDayOfMonth + index,
          ),
        ),
      );
    }
    return days;
  }

  int get weekStart =>
      dayController.today.day -
      (dayController.today.weekday == 7 ? 0 : dayController.today.weekday);
}
