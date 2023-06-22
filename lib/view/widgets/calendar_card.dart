import 'package:flutter/material.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/view_controller.dart';
import 'package:planner/view/widgets/spacers.dart';

class CalendarBox {
  CalendarBox({
    required this.date,
    this.tasks,
  });

  DateTime date;
  List<Task>? tasks;

  bool get isInCurrentMonth => date.month == viewController.today.month;
}

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.box,
  }) : super(key: key);

  final CalendarBox box;

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
          color: box.isInCurrentMonth
              ? Theme.of(context).splashColor
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(Spacers.xsmallSize),
          border: box.date == viewController.today
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
              box.date.day.toString(),
              style: TextStyle(
                color: box.isInCurrentMonth
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
