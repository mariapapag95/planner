import 'package:flutter/material.dart';
import 'package:planner/pages/all.dart';
import 'package:planner/state/view_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  viewState.getTasks();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: viewState.theme,
      home: All(),
    );
  }
}
