import '../data/models/task.dart';
import '../utils/constants.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {
  final TaskFilter filter;
  LoadTasks({this.filter = TaskFilter.all});
}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final Task task;
  UpdateTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String id;
  DeleteTask(this.id);
}

class FilterTasks extends TaskEvent {
  final TaskFilter filter;
  FilterTasks(this.filter);
}
