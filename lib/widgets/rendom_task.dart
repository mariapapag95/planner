import 'package:flutter/material.dart';
import 'package:planner/state/view_state.dart';
import 'package:planner/task_model.dart';
import 'package:planner/widgets/spacers.dart';

class RandomTask extends StatelessWidget {
  const RandomTask({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(viewState.randomTask.label),
        IconButton(
          icon: Icon(
            Icons.thumb_down_alt_sharp,
            size: Spacers.largeSize,
          ),
          onPressed: () => viewState.getRandomTask(),
        )
      ],
    );
  }
}
