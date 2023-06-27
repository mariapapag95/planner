import 'package:bidirectional_listview/bidirectional_listview.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class Week extends StatelessWidget {
  const Week({super.key});

  @override
  Widget build(BuildContext context) {
    return week.rebuild(
      () => BidirectionalListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Container(
          height: double.infinity,
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
        negativeItemCount: weekController.today.day,
        itemBuilder: (BuildContext context, int index) {
          bool isToday = index == 0;
          DateTime day = DateTime(
            weekController.today.year,
            weekController.today.month,
            weekController.today.day + index,
          );
          return SizedBox(
            width: (MediaQuery.of(context).size.width) /
                (weekController.weekdayExpanded ? 1 : 7),
            child: Column(
              children: [
                Text(
                  DateFormat('E').format(day).toUpperCase(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  DateFormat('d').format(day),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isToday
                        ? Theme.of(context).highlightColor
                        : Theme.of(context).primaryColorDark,
                    fontWeight: isToday ? FontWeight.w900 : FontWeight.normal,
                  ),
                ),
                for (Task task in weekController.weekTasks)
                  // if (task.date?.day == day.day)
                  Text(task.date?.day.toString() ?? 'no date')
              ],
            ),
          );
        },
      ),
    );
  }
}
