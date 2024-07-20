import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/custom_task_action_button.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({
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
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: AppStyles.styleMedium18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    AppConstants.checkIcon,
                    size: 28,
                    color: task.isCompleted ? AppColors.green : AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.white2),
              const SizedBox(height: 24),
              Text(
                task.description,
                style: AppStyles.styleMediumWhite14,
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  Expanded(
                    child: CustomTaskActionButton(
                      onPressed: () {},
                      text: AppStrings.done,
                      icon: const Icon(
                        AppConstants.checkIcon,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    child: CustomTaskActionButton(
                      onPressed: () {},
                      text: AppStrings.delete,
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    child: CustomTaskActionButton(
                      onPressed: () {},
                      text: AppStrings.edit,
                      icon: const Icon(
                        Icons.edit_document,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
