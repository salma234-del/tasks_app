import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateTaskCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgBegin,
          title: const Text(
            AppStrings.taskDetails,
            style: AppStyles.styleMedium16,
          ),
        ),
        body: TaskDetailsViewBody(
          task: task,
        ),
      ),
    );
  }
}
