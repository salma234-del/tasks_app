import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/get_tasks_builder.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultHorizontalPadding,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.tasksList,
              style: AppStyles.styleRegular16,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GetTasksBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
