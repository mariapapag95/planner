import 'package:flutter/material.dart';
import 'package:planner/state/day_state.dart';
import 'package:planner/state/view_state.dart';
import 'package:planner/task_model.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: viewState.taskTextFieldController,
          maxLines: 3,
          autocorrect: false,
          autofocus: true,
          onTapOutside: (PointerDownEvent event) =>
              viewState.taskTextFieldFocus.unfocus(),
          // Will this dismiss keyboard automatically?
          decoration: InputDecoration(
            hintText: 'Task',
          ),
        ),
        TextFormField(
          controller: viewState.detailsTextFieldController,
          maxLines: 3,
          autocorrect: false,
          autofocus: true,
          onTapOutside: (PointerDownEvent event) =>
              viewState.detailsTextFieldFocus.unfocus(),
          // Will this dismiss keyboard automatically?
          decoration: InputDecoration(
            hintText: 'Details',
          ),
        ),
        DatePickerDialog(
          initialDate: dayState.today,
          firstDate: dayState.today,
          lastDate: dayState.today.add(Duration(days: 365)),
          fieldHintText: 'Date',
        ),
        TimePickerDialog(initialTime: TimeOfDay.now()),
        IconButton(
          onPressed: () => viewState.addTask(
            Task(
              id: 1,
              label: viewState.taskTextFieldController.text,
              details: viewState.detailsTextFieldController.text,
              createdOn: DateTime.now(),
            ),
          ),
          icon: Icon(Icons.add_circle),
        )
      ],
    );
  }
}
