import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/tasks_list_view.dart';

class GetTasksSuccessStateBody extends StatelessWidget {
  const GetTasksSuccessStateBody({
    required this.tasks,
    super.key,
  });
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.incompleteTasks,
          style: AppStyles.styleMediumWhite14,
        ),
        const SizedBox(height: 16),
        TasksListView(
          tasks: tasks.where((task) => !task.isCompleted).toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          AppStrings.completedTasks,
          style: AppStyles.styleMediumWhite14,
        ),
        const SizedBox(height: 16),
        TasksListView(
          tasks: tasks.where((task) => task.isCompleted).toList(),
        ),
      ],
    );
  }
}
