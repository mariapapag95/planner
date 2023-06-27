import 'package:flutter/material.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/view/widgets/spacers.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Spacers.mediumSize,
          Spacers.mediumSize,
          Spacers.mediumSize,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: viewController.taskTextFieldController,
              maxLines: 2,
              autocorrect: false,
              autofocus: true,
              onTapOutside: (PointerDownEvent event) =>
                  viewController.taskTextFieldFocus.unfocus(),
              // Will this dismiss keyboard automatically?
              decoration: const InputDecoration(
                hintText: 'Task',
              ),
            ),
            TextFormField(
              controller: viewController.detailsTextFieldController,
              maxLines: 3,
              autocorrect: false,
              onTapOutside: (PointerDownEvent event) =>
                  viewController.detailsTextFieldFocus.unfocus(),
              // Will this dismiss keyboard automatically?
              decoration: const InputDecoration(
                hintText: 'Details',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: dayController.today.hour,
                            minute: dayController.today.minute,
                          ),
                        );
                        if (time != null) {
                          viewController.setTaskTimeValue(time);
                        }
                      },
                      icon: const Icon(
                        Icons.access_time_sharp,
                        size: Spacers.mediumSize,
                      ),
                    ),
                    IconButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => DatePickerDialog(
                          initialDate: dayController.today,
                          firstDate: dayController.today,
                          lastDate: dayController.today
                              .add(const Duration(days: 365)),
                          fieldHintText: 'Date',
                        ),
                      ),
                      icon: const Icon(
                        Icons.calendar_today_rounded,
                        size: Spacers.mediumSize,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    viewController.addTask(
                      Task(
                        id: viewController.tasks.length,
                        label: viewController.taskTextFieldController.text,
                        details: viewController.detailsTextFieldController.text,
                        createdOn: DateTime.now(),
                        date: viewController.dateTextFieldValue,
                        time: viewController.timeTextFieldValue,
                      ),
                    );
                    viewController.taskTextFieldController.clear();
                    viewController.detailsTextFieldController.clear();
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).highlightColor,
                    size: Spacers.largeSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
