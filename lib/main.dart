import 'package:flutter/material.dart';
import 'package:planner/controller/view_controller.dart';
import 'package:planner/view/pages/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  viewController.getTasks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: viewController.theme,
      home: const All(),
    );
  }
}
