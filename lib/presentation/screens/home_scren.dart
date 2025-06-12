import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../bloc/task_state.dart';
import '../../bloc/theme_bloc.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles_constant.dart';
import '../widgets/task_tile.dart';
import 'task_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextConstants.taskManager,
          style: TextStyles.appBarTitle,
        ),
        backgroundColor: const Color.fromARGB(255, 76, 159, 226),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeBloc>().toggleTheme(),
          ),
          PopupMenuButton<TaskFilter>(
            onSelected: (filter) {
              context.read<TaskBloc>().add(FilterTasks(filter));
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: TaskFilter.all,
                child: Text(
                  TextConstants.all,
                  style: TextStyles.popupMenuItem,
                ),
              ),
              PopupMenuItem(
                value: TaskFilter.completed,
                child: Text(
                  TextConstants.completed,
                  style: TextStyles.popupMenuItem,
                ),
              ),
              PopupMenuItem(
                value: TaskFilter.pending,
                child: Text(
                  TextConstants.pending,
                  style: TextStyles.popupMenuItem,
                ),
              ),
            ],
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            final tasks = state.filter == TaskFilter.all
                ? state.tasks
                : state.filter == TaskFilter.completed
                    ? state.tasks.where((task) => task.isDone).toList()
                    : state.tasks.where((task) => !task.isDone).toList();
            if (tasks.isEmpty) {
              return Center(
                child: Text(
                  TextConstants.notaskFoundForTheSelectedFilter,
                  style: TextStyles.popupMenuItem,
                ),
              );
            }
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskTile(task: task);
              },
            );
          } else if (state is TaskError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyles.errorMessage,
              ),
            );
          }
          return Center(
            child: Text(
              TextConstants.noTasksFound,
              style: TextStyles.popupMenuItem,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TaskFormScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
