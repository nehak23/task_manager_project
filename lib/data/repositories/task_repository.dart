import 'package:hive/hive.dart';
import 'package:task_manager_project/utils/constants.dart';
import '../models/task.dart';

class TaskRepository {
  final Box<Task> _taskBox = Hive.box<Task>(TextConstants.tasks);

  List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  Future<void> addTask(Task task) async {
    try {
      await _taskBox.put(task.id, task);
    } catch (e) {
      throw Exception('${TextConstants.failedToAddTask} $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _taskBox.put(task.id, task);
    } catch (e) {
      throw Exception('${TextConstants.failedToUpdateTask} $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _taskBox.delete(id);
    } catch (e) {
      throw Exception('${TextConstants.failedToDeleteTask} $e');
    }
  }
}
