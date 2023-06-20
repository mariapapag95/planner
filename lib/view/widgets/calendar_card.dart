import 'package:flutter/material.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/month_state.dart';
import 'package:planner/view/widgets/spacers.dart';

class CalendarCardItem {
  CalendarCardItem({
    required this.day,
    required this.isInCurrentMonth,
    this.tasks,
  });

  int day;
  bool isInCurrentMonth;
  List<Task>? tasks;
}

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key? key,
    required this.day,
  }) : super(key: key);

  final CalendarCardItem day;

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
          border: day.day == monthState.today.day &&
                  monthState.displayDate.month == monthState.today.month
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
              day.day.toString(),
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
