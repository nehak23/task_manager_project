import '../data/models/task.dart';
import '../utils/constants.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final TaskFilter filter;

  TaskLoaded({required this.tasks, this.filter = TaskFilter.all});
}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});
}
