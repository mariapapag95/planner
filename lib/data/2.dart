// import 'dart:async';
// import 'dart:io';
//
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'data.dart';
//
// class TaskDatabaseProvider {
//   TaskDatabaseProvider._();
//
//   static final TaskDatabaseProvider db = TaskDatabaseProvider._();
//   Database _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     _database = await getDatabaseInstance();
//     return _database;
//   }
//
//   Future<Database> getDatabaseInstance() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, 'tasks.db');
//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//           await db.execute('CREATE TABLE tasks ('
//               'id integer primary key AUTOINCREMENT,'
//               'label TEXT,'
//               'details TEXT,'
//               'dueDate INTEGER'
//               ')');
//         });
//   }
//
//   addTaskToDatabase(Task task) async {
//     final db = await database;
//     var raw = await db.insert(
//       'tasks',
//       task.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return raw;
//   }
//
//   updateTask(Task task) async {
//     final db = await database;
//     var response = await db.update('Task', task.toMap(),
//         where: 'id = ?', whereArgs: [task.id]);
//     return response;
//   }
//
//   Future<Task> getTaskWithId(int id) async {
//     final db = await database;
//     var response = await db.query('Task', where: 'id = ?', whereArgs: [id]);
//     return response.isNotEmpty ? Task.fromMap(response.first) : null;
//   }
//
//   Future<List<Task>> getAllTasks() async {
//     final db = await database;
//     var response = await db.query('Task');
//     List<Task> list = response.map((c) => Task.fromMap(c)).toList();
//     return list;
//   }
//
//   deleteTaskWithId(int id) async {
//     final db = await database;
//     return db.delete('Task', where: 'id = ?', whereArgs: [id]);
//   }
//
//   deleteAllTasks() async {
//     final db = await database;
//     db.delete('Task');
//   }
// }
//
//
//
//
//
//
// // class TaskDatabaseProvider {
// //   TaskDatabaseProvider._();
// //
// //   static final TaskDatabaseProvider db = TaskDatabaseProvider._();
// //   Database _database;
// //
// //   Future<Database> get database async {
// //     if (_database != null) return _database;
// //     _database = await getDatabaseInstance();
// //     return _database;
// //   }
// //
// //   Future<Database> getDatabaseInstance() async {
// //     Directory directory = await getApplicationDocumentsDirectory();
// //     String path = join(directory.path, 'person.db');
// //     return await openDatabase(path, version: 1,
// //         onCreate: (Database db, int version) async {
// //           await db.execute('CREATE TABLE Task ('
// //               'id integer primary key AUTOINCREMENT,'
// //               'name TEXT,'
// //               'city TEXT'
// //               ')');
// //         });
// //   }
// //
// //   addTaskToDatabase(Task person) async {
// //     final db = await database;
// //     var raw = await db.insert(
// //       'Task',
// //       Task.toMap(),
// //       conflictAlgorithm: ConflictAlgorithm.replace,
// //     );
// //     return raw;
// //   }
// //
// //   updateTask(Task person) async {
// //     final db = await database;
// //     var response = await db.update('Task', Task.toMap(),
// //         where: 'id = ?', whereArgs: [person.id]);
// //     return response;
// //   }
// //
// //   Future<Task> getTaskWithId(int id) async {
// //     final db = await database;
// //     var response = await db.query('Task', where: 'id = ?', whereArgs: [id]);
// //     return response.isNotEmpty ? Task.fromMap(response.first) : null;
// //   }
// //
// //   Future<List<Task>> getAllTasks() async {
// //     final db = await database;
// //     var response = await db.query('Task');
// //     List<Task> list = response.map((c) => Task.fromMap(c)).toList();
// //     return list;
// //   }
// //
// //   deleteTaskWithId(int id) async {
// //     final db = await database;
// //     return db.delete('task', where: 'id = ?', whereArgs: [id]);
// //   }
// //
// //   deleteAllTasks() async {
// //     final db = await database;
// //     db.delete('task');
// //   }
// // }
