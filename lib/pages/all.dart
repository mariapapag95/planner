import 'package:flutter/material.dart';
import 'package:planner/state/view_state.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: view.rebuild(
          () => Column(
            children: [
              for (Widget section in viewState.sections)
                Expanded(
                  child: GestureDetector(
                    onTap: () => viewState.openView(section),
                    onDoubleTap: () => viewState.closeView(section),
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dy > sensitivity) {
                        // Down Swipe

                      } else if (details.delta.dy < -sensitivity) {
                        // Up Swipe
                        viewState.showAddTaskModal(context);
                      }
                    },
                    child: section,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
