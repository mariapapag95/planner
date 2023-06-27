import 'package:flutter/material.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/widgets/spacers.dart';

class CalendarDay {
  CalendarDay({
    required this.date,
    this.tasks,
  });

  DateTime date;
  List<Task>? tasks;

  bool get isInCurrentMonth => date.month == viewController.today.month;
}

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key? key,
    required this.day,
  }) : super(key: key);

  final CalendarDay day;

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
          color: day.isInCurrentMonth
              ? Theme.of(context).splashColor
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(Spacers.xsmallSize),
          border: day.date == viewController.today
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
              day.date.day.toString(),
              style: TextStyle(
                color: day.isInCurrentMonth
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).shadowColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
