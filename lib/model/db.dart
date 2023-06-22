// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as _path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:planner/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TasksDB {
  static final TasksDB _instance = TasksDB.internal();
  factory TasksDB() => _instance;

  Database? _database;

  TasksDB.internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    final path = _path.join(directory.path, 'tasks.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE IF NOT EXISTS tasks ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'label TEXT, '
        'details TEXT, '
        'date INTEGER, '
        'time INTEGER, '
        'createdOn INTEGER)',
      );
    });
  }

  Future<List<Task>?> getTasks() async {
    final db = await database;
    if (db == null) {
      return null;
    }
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(
      maps.length,
      (index) {
        return Task.fromMap(maps[index]);
      },
    );
  }

  Future<int?> addTask(Task task) async {
    final db = await database;
    if (db == null) {
      return null;
    }
    return await db.insert('tasks', task.toMap());
  }

  Future<int?> deleteTask(int taskId) async {
    final db = await database;
    if (db == null) {
      return null;
    }
    return await db.delete('tasks', where: 'id = ?', whereArgs: [taskId]);
  }
}
