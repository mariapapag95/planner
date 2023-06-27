import 'package:flutter/material.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/widgets/spacers.dart';

class CalendarDate {
  CalendarDate({
    required this.date,
  });

  DateTime date;
  List<Task> get tasks => monthController.monthTasks
      .where((Task task) =>
          task.date?.day == date.day &&
          task.date?.month == date.month &&
          task.date?.year == date.year)
      .toList();

  bool get isInCurrentMonth => date.month == viewController.today.month;
}

class CalendarCard extends StatelessWidget {
  const CalendarCard({Key? key, required this.date}) : super(key: key);

  final CalendarDate date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Spacers.xxsmallSize,
        left: Spacers.xxsmallSize,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          Spacers.xxsmallSize,
        ),
        decoration: BoxDecoration(
          color: date.isInCurrentMonth
              ? Theme.of(context).splashColor
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(Spacers.xsmallSize),
          border: date.date == viewController.today
              ? Border.all(
                  color: Theme.of(context).highlightColor,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date.date.day.toString(),
              style: TextStyle(
                color: date.isInCurrentMonth
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).shadowColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                date.tasks.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    left: Spacers.xxsmallSize,
                    bottom: Spacers.xxsmallSize,
                  ),
                  child: Container(
                    height: Spacers.xsmallSize,
                    width: Spacers.xsmallSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: date.isInCurrentMonth
                          ? Theme.of(context).highlightColor
                          : Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
