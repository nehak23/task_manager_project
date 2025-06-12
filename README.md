Task Manager App

A simple Task Manager application built with Flutter, featuring task creation, editing, deletion, status toggling, and filtering, with a clean UI and local storage using Hive. The app uses BLoC for state management and includes a light/dark theme toggle.

Features--
Home Page: Displays a list of tasks with title and status (Done/Pending).
Add/Edit Task: Form to add or edit tasks with title, description, and due date.
Mark Task as Done: Toggle task completion status.
Swipe to Delete: Remove tasks with a swipe gesture.
Task Filtering: Filter tasks by All, Completed, or Pending.
Theme Toggle: Switch between light and dark themes.
Local Storage: Persist tasks using Hive.
Basic Testing: Includes a widget test for the task tile.

Tech Stack--
Framework: Flutter
State Management: BLoC
Local Storage: Hive

Dependencies:
flutter_bloc: ^8.1.3
hive: ^2.2.3
hive_flutter: ^1.1.0
uuid: ^3.0.7
flutter_test (for testing)
hive_generator and build_runner (for code generation)

Setup Instructions--
Clone the Repository:
                      git clone <repository-url>
                      cd task_manager_project

Install Dependencies: Ensure you have Flutter installed, then run:
                      flutter pub get

Generate Hive Adapters: Run the following command to generate the task.g.dart file:
                      flutter pub run build_runner build

Run the App: Launch the app on a simulator/emulator or physical device:
                      flutter run

Run Tests: Execute the widget tests:
                      flutter test

Usage--
Home Screen:
View all tasks with their titles and due dates.
Use the filter menu (top-right) to show All, Completed, or Pending tasks.
Toggle the theme (light/dark) using the theme icon in the AppBar.
Swipe a task to delete it or tap to edit.
Press the floating action button to add a new task.

Add/Edit Task Screen:
Enter a task title (required), description (optional), and select a due date.
Save the task to add or update it

Error Handling--
The app handles errors during task operations (add, update, delete) and displays them to the user via the UI.
Hive operations are wrapped in try-catch blocs to ensure robust data handling.
