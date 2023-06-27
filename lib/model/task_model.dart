import 'package:flutter/material.dart';

class Task {
  final int id;
  final String label;
  final String? details;
  final DateTime? date;
  final TimeOfDay? time;
  final DateTime createdOn;

  IconData get categoryIcon => Icons.label_important;

  Task({
    required this.id,
    required this.label,
    this.details,
    this.date,
    this.time,
    required this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'details': details,
      'date': date?.millisecondsSinceEpoch,
      'time': time?.minute,
      'createdOn': createdOn.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      label: map['label'] as String,
      details: map['details'] as String?,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      time: map['time'] != null
          ? TimeOfDay(hour: map['time'] ~/ 60, minute: map['time'] % 60)
          : null,
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['createdOn'] as int),
    );
  }
}
