import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
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
            Spacers.small,
            AnimatedContainer(
              duration: const Duration(
                seconds: 2,
              ),
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).splashColor,
              ),
              height: 100,
              width: dayController.isSelected
                  ? MediaQuery.of(context).size.width - Spacers.smallSize
                  : 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    DateFormat('MMM').format(dayController.today).toUpperCase(),
                  ),
                  Text(
                    DateFormat('d').format(dayController.today).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    DateFormat('y').format(dayController.today).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Spacers.regular,
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (Task task in dayController.dayTasks)
                    InkWell(
                      onLongPress: () => viewController.deleteTask(task),
                      child: Row(
                        children: [
                          Text(task.label),
                          if ((task.details ?? '').isNotEmpty)
                            Text(
                              ' - ${task.details!}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
