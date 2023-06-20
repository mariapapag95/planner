import 'package:flutter/material.dart';
import 'package:planner/model/task_model.dart';
import 'package:planner/state/view_state.dart';
import 'package:planner/view/widgets/spacers.dart';

class RandomTask extends StatelessWidget {
  const RandomTask({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(viewState.randomTask.label),
        IconButton(
          icon: const Icon(
            Icons.thumb_down_alt_sharp,
            size: Spacers.mediumSize,
          ),
          onPressed: () => viewState.getRandomTask(),
        )
      ],
    );
  }
}
