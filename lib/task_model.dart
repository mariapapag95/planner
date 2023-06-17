import 'dart:convert';

class Task {
  final int id;
  final String label;
  final String? details;
  final DateTime? date;
  final DateTime? time;
  final DateTime createdOn;

  const Task({
    required this.id,
    required this.label,
    this.details,
    this.date,
    this.time,
    required this.createdOn,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json['id'],
        label: json['label'],
        details: json['details'],
        date: json['date'],
        time: json['time'],
        createdOn: json['createdOn'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'label': label,
        'details': details,
        'date': date,
        'time': time,
        'createdOn': createdOn,
      };

  Task taskFromJson(String str) {
    final jsonData = json.decode(str);
    return Task.fromMap(jsonData);
  }

  String taskToJson(Task data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }
}
