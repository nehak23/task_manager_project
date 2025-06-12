import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime dueDate;
  @HiveField(4)
  final bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isDone = false,
  });
}
