import 'package:flutter/material.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: view.rebuild(
          () => GestureDetector(
            onVerticalDragUpdate: (details) {
              int sensitivity = 8;
              if (details.delta.dy > sensitivity) {
                // Down Swipe
                viewController.getRandomTask();
              } else if (details.delta.dy < -sensitivity) {
                // Up Swipe
                viewController.showAddTaskModal(context);
              }
            },
            child: Column(
              children: [
                for (Widget section in viewController.sections)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => viewController.openView(section),
                      onDoubleTap: () => viewController.closeView(section),
                      child: section,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
