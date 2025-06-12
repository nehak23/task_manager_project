import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_project/utils/constants.dart';

import '../data/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc(this._taskRepository) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<FilterTasks>(_onFilterTasks);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = _taskRepository.getAllTasks();
      if (tasks.isEmpty) {
        emit(TaskError(message: TextConstants.noTasksFound));
        return;
      }
      emit(TaskLoaded(tasks: tasks, filter: event.filter));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      await _taskRepository.addTask(event.task);
      final tasks = _taskRepository.getAllTasks();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await _taskRepository.updateTask(event.task);
      final tasks = _taskRepository.getAllTasks();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      await _taskRepository.deleteTask(event.id);
      final tasks = _taskRepository.getAllTasks();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  void _onFilterTasks(FilterTasks event, Emitter<TaskState> emit) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      emit(TaskLoaded(tasks: currentState.tasks, filter: event.filter));
    }
  }
}
