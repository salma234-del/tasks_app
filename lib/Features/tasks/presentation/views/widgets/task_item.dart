import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.taskDetailsView,
          extra: task,
        );
      },
      child: Container(
        width: AppSizes.screenWidth(context),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: task.isCompleted ? AppColors.green : AppColors.black2,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                task.title,
                style: AppStyles.styleMediumBlack14,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
