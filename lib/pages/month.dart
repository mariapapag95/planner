import 'package:flutter/material.dart';
import 'package:planner/state/month_state.dart';
import 'package:intl/intl.dart';
import 'package:planner/widgets/calendar_card.dart';
import 'package:planner/widgets/spacers.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class Month extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return month.rebuild(
      () => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).focusColor,
                      size: 16,
                    ),
                  ),
                  onTap: () => monthState.previousMonth(),
                ),
                Text(
                  DateFormat('MMMM y')
                      .format(monthState.displayDate)
                      .toUpperCase(),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Theme.of(context).focusColor,
                      size: 16,
                    ),
                  ),
                  onTap: () => monthState.nextMonth(),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                print(details);
                if (details.primaryVelocity == 0)
                  return; // user have just tapped on screen (no dragging)

                if (details.primaryVelocity?.compareTo(0) == -1) {
                  monthState.nextMonth();
                } else {
                  monthState.previousMonth();
                }
              },
              child: Container(
                child: GridView.count(
                  padding: EdgeInsets.all(Spacers.smallSize),
                  childAspectRatio: 1.25,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 7,
                  children: [
                    for (CalendarCardItem day in monthState.allCalendarDays)
                      CalendarCard(day: day),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
