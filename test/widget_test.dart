import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_project/data/models/task.dart';
import 'package:task_manager_project/presentation/widgets/task_tile.dart';

void main() {
  testWidgets('TaskTile displays task title and due date',
      (WidgetTester tester) async {
    final task = Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      dueDate: DateTime(2025, 6, 10),
      isDone: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TaskTile(task: task),
        ),
      ),
    );

    expect(find.text('Test Task'), findsOneWidget);
    expect(find.text('Due: 2025-06-10'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });
}
