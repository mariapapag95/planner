import 'package:flutter/material.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/day_state.dart';
import 'package:planner/state/view_state.dart';
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
              controller: viewState.taskTextFieldController,
              maxLines: 2,
              autocorrect: false,
              autofocus: true,
              onTapOutside: (PointerDownEvent event) =>
                  viewState.taskTextFieldFocus.unfocus(),
              // Will this dismiss keyboard automatically?
              decoration: const InputDecoration(
                hintText: 'Task',
              ),
            ),
            TextFormField(
              controller: viewState.detailsTextFieldController,
              maxLines: 3,
              autocorrect: false,
              onTapOutside: (PointerDownEvent event) =>
                  viewState.detailsTextFieldFocus.unfocus(),
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
                            hour: dayState.today.hour,
                            minute: dayState.today.minute,
                          ),
                        );
                        if (time != null) {
                          viewState.setTaskTimeValue(time);
                        }
                        // TimePickerDialog(
                        //   initialTime: TimeOfDay(
                        //     hour: dayState.today.hour,
                        //     minute: dayState.today.minute,
                        //   ),
                        // )
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
                          initialDate: dayState.today,
                          firstDate: dayState.today,
                          lastDate:
                              dayState.today.add(const Duration(days: 365)),
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
                  onPressed: () => viewState.addTask(
                    Task(
                      id: viewState.tasks.length,
                      label: viewState.taskTextFieldController.text,
                      details: viewState.detailsTextFieldController.text,
                      createdOn: DateTime.now(),
                      date: viewState.dateTextFieldValue,
                      time: viewState.timeTextFieldValue,
                    ),
                  ),
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
