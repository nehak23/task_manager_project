import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_project/utils/constants.dart';

import 'package:uuid/uuid.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../bloc/theme_bloc.dart';
import '../../data/models/task.dart';
import '../../utils/text_styles_constant.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;
  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.task?.description ?? '');
    _dueDate = widget.task?.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.task == null ? TextConstants.addTask : TextConstants.editTask,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeBloc>().toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) =>
                    value!.isEmpty ? TextConstants.titleValidateText : null,
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Color.fromARGB(255, 126, 184, 231),
                style: TextStyles.taskTitle,
                decoration: InputDecoration(
                  labelText: TextConstants.titleText,
                  labelStyle: TextStyles.taskDetails.copyWith(
                    color: Color.fromARGB(255, 99, 172, 233),
                  ),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyles.errorMessage.copyWith(
                    color: Color.fromARGB(255, 247, 101, 99),
                  ),
                  hintText: TextConstants.titleHintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 163, 205, 240),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 163, 205, 240),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) => value!.isEmpty
                    ? TextConstants.descriptionValidateText
                    : null,
                style: TextStyles.taskDetails,
                decoration: InputDecoration(
                  labelText: TextConstants.descriptionText,
                  labelStyle: TextStyles.taskDetails.copyWith(
                    color: Color.fromARGB(255, 99, 172, 233),
                  ),
                  border: OutlineInputBorder(),
                  hintText: TextConstants.descriptionHintText,
                  errorStyle: TextStyles.errorMessage.copyWith(
                    color: Color.fromARGB(255, 247, 101, 99),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 163, 205, 240),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 163, 205, 240),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  _dueDate == null
                      ? TextConstants.selectDueDate
                      : '${_dueDate!.day.toString().padLeft(2, '0')}/${_dueDate!.month.toString().padLeft(2, '0')}/${_dueDate!.year}',
                  style: TextStyles.taskDetails,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 163, 205, 240),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                trailing: Icon(
                  Icons.calendar_today,
                  color: Color.fromARGB(255, 76, 159, 226),
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return child!;
                    },
                  );
                  if (selectedDate != null) {
                    setState(() => _dueDate = selectedDate);
                  }
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _dueDate != null) {
                    final task = Task(
                      id: widget.task?.id ?? const Uuid().v4(),
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dueDate: _dueDate!,
                      isDone: widget.task?.isDone ?? false,
                    );
                    context.read<TaskBloc>().add(
                          widget.task == null
                              ? AddTask(task)
                              : UpdateTask(task),
                        );
                    Navigator.pop(context);
                  } else if (_dueDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          TextConstants.pleaseSelectDueDate,
                          style: TextStyles.errorMessage
                              .copyWith(color: Colors.black),
                        ),
                        backgroundColor: Color.fromARGB(255, 129, 187, 235),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.black.withAlpha((0.25 * 255).toInt()),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 129, 187, 235),
                        Color.fromARGB(255, 76, 159, 226),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      widget.task == null
                          ? TextConstants.addText
                          : TextConstants.updateText,
                      style: TextStyles.taskTitle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
