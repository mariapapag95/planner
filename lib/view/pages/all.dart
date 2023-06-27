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
              int sensitivity = 3;
              if (details.delta.dy > sensitivity) {
                // Down Swipe
                viewController.getRandomTask();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(viewController.randomTask.label),
                        content: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 200,
                            minWidth: 700,
                          ),
                          child: Column(
                            children: <Widget>[
                              if (viewController.randomTask.details != null)
                                Text(viewController.randomTask.details!),
                              // TODO: Add more info
                            ],
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () => viewController
                                .deleteTask(viewController.randomTask),
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                          IconButton(
                            onPressed: Navigator.of(context).pop,
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: viewController.getRandomTask,
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                      );
                    });
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
