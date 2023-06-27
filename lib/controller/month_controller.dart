import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/pages/month.dart';
import 'package:planner/view/widgets/calendar_card.dart';

class MonthController {
  int daysInAWeek = 7;
  int weeksInAMonth = 5;
  int calendarLength = 35;

  DateTime displayDate = DateTime.now();

  bool get isSelected => viewController.sections == [const Month()];

  List<Task> get monthTasks => viewController.tasks.where((Task task) {
        DateTime? taskDate = task.date;
        Duration oneSecond = const Duration(seconds: 1);
        DateTime start = allCalendarDays.first.date.subtract(oneSecond);
        DateTime end = allCalendarDays.last.date.add(oneSecond);
        if (taskDate == null) return false;
        return taskDate.isAfter(start) && taskDate.isBefore(end);
      }).toList();

  int get monthStartWeekday => monthStart.weekday == 7 ? 0 : monthStart.weekday;
  DateTime get monthStart => DateTime(displayDate.year, displayDate.month, 1);
  DateTime get monthEnd => DateTime(displayDate.year, displayDate.month + 1, 0);

  List<CalendarDate> get allCalendarDays => List.generate(
        calendarLength,
        (int index) {
          return CalendarDate(
            date: (monthStart.subtract(Duration(days: monthStartWeekday))).add(
              Duration(days: index),
            ),
          );
        },
      );

  void previousMonth() {
    displayDate = displayDate.subtract(Duration(days: monthEnd.day));
    month.notify();
  }

  void nextMonth() {
    displayDate = displayDate.add(Duration(days: monthEnd.day));
    month.notify();
  }
}
