import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/day_state.dart';
import 'package:planner/view/widgets/spacers.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class Day extends StatelessWidget {
  const Day({super.key});

  @override
  Widget build(BuildContext context) {
    return day.rebuild(
      () => Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).splashColor,
              ),
              height: 100,
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    DateFormat('MMM').format(dayState.today).toUpperCase(),
                  ),
                  Text(
                    DateFormat('d').format(dayState.today).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    DateFormat('y').format(dayState.today).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Spacers.regular,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (Task task in dayState.toDo)
                  Row(
                    children: [
                      Text(task.label),
                      if (task.details != null)
                        Text(
                          ' - ${task.details!}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        )
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}