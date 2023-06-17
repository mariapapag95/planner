// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
//
// class Task {
//   final int id;
//   final String label;
//   final String? details;
//   final int? dueDate;
//
//   const Task({
//     required this.id,
//     required this.label,
//     this.details,
//     this.dueDate,
//   });
//
//   Task.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         label = json['label'],
//         details = json['details'],
//         dueDate = json['dueDate'];
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'label': label,
//         'details': details,
//         'dueDate': dueDate,
//       };
// }
//
// class Tasks {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     print('local path');
//     print(directory.path);
//     return directory.path;
//   }
//
//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/data.json');
//   }
//
//   Future<String> readTask() async {
//     print('inside read task');
//     try {
//       final file = await _localFile;
//       // Read the file
//       final contents = await file.readAsString();
//
//       print(contents.runtimeType);
//       print(contents);
//
//       // final favorite = Task.fromJson(file);
//       // print(jsonDecode(favorite));
//
//       return contents;
//     } catch (e) {
//       print(e);
//       // If encountering an error, return 0
//       return 'null';
//     }
//   }
//
//   Future<File> writeTask(String task) async {
//     final file = await _localFile;
//
//     // Write the file
//     return file.writeAsString(task);
//   }
// }
