import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_project/utils/constants.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../data/models/task.dart';
import '../../utils/text_styles_constant.dart';
import '../screens/task_form_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  String _monthName(int month) {
    const months = TextConstants.monthList;
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<TaskBloc>().add(DeleteTask(task.id));
      },
      background: Container(
        color: const Color.fromARGB(255, 241, 94, 84),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            task.title,
          ),
          dense: true,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 163, 205, 240),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${TextConstants.dueOnText} ${task.dueDate.day} ${TextConstants.ofText} ${_monthName(task.dueDate.month)} ${task.dueDate.year}',
              ),
              Text(
                  task.isDone
                      ? '(${TextConstants.completed})'
                      : '(${TextConstants.pending})',
                  style: TextStyle(
                    color: task.isDone
                        ? const Color.fromARGB(255, 33, 175, 76)
                        : const Color.fromARGB(255, 241, 94, 84),
                  )),
            ],
          ),
          leading: GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TaskFormScreen(task: task)),
                  ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 163, 205, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              )),
          trailing: Checkbox(
            value: task.isDone,
            fillColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 131, 190, 238)),
            side: WidgetStateBorderSide.resolveWith(
              (states) {
                return BorderSide(
                  color: const Color.fromARGB(255, 131, 190, 238),
                );
              },
            ),
            onChanged: (value) {
              context.read<TaskBloc>().add(UpdateTask(
                    task.copyWith(isDone: value ?? false),
                  ));
            },
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Column(
                  children: [
                    Text(
                      task.title,
                      style: TextStyles.appBarTitle,
                    ),
                    Text(
                        task.isDone
                            ? '(${TextConstants.completed})'
                            : '(${TextConstants.pending})',
                        style: TextStyle(
                          color: task.isDone
                              ? const Color.fromARGB(255, 33, 175, 76)
                              : const Color.fromARGB(255, 241, 94, 84),
                          fontSize: 15,
                        )),
                  ],
                ),
                content: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 240, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.description,
                        style: TextStyles.taskDetails,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      TextConstants.closeText,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on Task {
  Task copyWith(
      {String? title, String? description, DateTime? dueDate, bool? isDone}) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }
}
