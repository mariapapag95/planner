import 'package:flutter/material.dart';
import 'package:planner/state/view_state.dart';
import 'package:planner/view/pages/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  viewState.getTasks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: viewState.theme,
      home: const All(),
    );
  }
}
