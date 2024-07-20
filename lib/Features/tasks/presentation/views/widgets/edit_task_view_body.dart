import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/edit_task_form.dart';

class EditTaskViewBody extends StatelessWidget {
  const EditTaskViewBody({
    required this.task,
    super.key,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.defaultHorizontalPadding,
            vertical: 20,
          ),
          child: EditTaskForm(task: task),
        ),
      ),
    );
  }
}
