import 'package:planner/state/view_state.dart';
import 'package:planner/task_model.dart';
import 'package:planner/widgets/calendar_card.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var month = RM.inject(() => MonthState());
var monthState = month.state;

class MonthState {
  DateTime today = DateTime.now();
  int calendarLength = 35;

  DateTime displayDate = DateTime.now();

  DateTime get monthStart => DateTime(displayDate.year, displayDate.month, 1);
  DateTime get monthEnd => DateTime(displayDate.year, displayDate.month + 1, 0);

  int get monthStartWeekday => monthStart.weekday == 7 ? 0 : monthStart.weekday;

  int get previousMonthLastDay =>
      DateTime(displayDate.year, displayDate.month - 1, 0).day;

  int get monthStartDay => monthStart.day;
  int get monthEndDay => monthEnd.day;

  List<CalendarCardItem> get allCalendarDays => List.generate(
        35,
        (index) {
          if (index < monthStartWeekday + monthEndDay) {
            if (index < monthStartWeekday) {
              return CalendarCardItem(
                day: previousMonthLastDay - monthStartWeekday + index,
                isInCurrentMonth: false,
                tasks: viewState.tasks
                    .where(
                      (Task task) =>
                          // DateTime(
                          //     DateTime.now().year,
                          //     DateTime.now().month,
                          (task.date ?? DateTime.now()).day
                          // ).day
                          ==
                          previousMonthLastDay - monthStartWeekday + index,
                    )
                    .toList(),
              );
            }
            return CalendarCardItem(
              day: -monthStartWeekday + index + 1,
              isInCurrentMonth: true,
              tasks: viewState.tasks
                  .where(
                    (Task task) =>
                        // DateTime(
                        //     DateTime.now().year,
                        //     DateTime.now().month,
                        (task.date ?? DateTime.now()).day
                        // ).day
                        ==
                        -monthStartWeekday + index + 1,
                  )
                  .toList(),
            );
          } else {
            return CalendarCardItem(
              day: -monthStartWeekday - monthEndDay + index + 1,
              isInCurrentMonth: false,
              tasks: viewState.tasks
                  .where(
                    (Task task) =>
                        // DateTime(
                        //     DateTime.now().year,
                        //     DateTime.now().month,
                        (task.date ?? DateTime.now()).day
                        // ).day
                        ==
                        -monthStartWeekday - monthEndDay + index + 1,
                  )
                  .toList(),
            );
          }
        },
      );

  void previousMonth() {
    displayDate =
        DateTime(displayDate.year, displayDate.month - 1, displayDate.day);
    month.notify();
  }

  void nextMonth() {
    displayDate =
        DateTime(displayDate.year, displayDate.month + 1, displayDate.day);
    month.notify();
  }
}
