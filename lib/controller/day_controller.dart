import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/pages/day.dart';

class DayController {
  DateTime today = DateTime.now();

  bool get isSelected => viewController.sections == [const Day()];

  List<Task> get dayTasks => viewController.tasks
      .where(
        (Task task) =>
            task.date == null || task.date?.day == DateTime.now().day,
      )
      .toList();
}
