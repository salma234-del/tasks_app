import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/widgets/custom_app_bar.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/update_task_cubit/update_task_cubit.dart';
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
        appBar: const CustomAppBar(
          title: AppStrings.taskDetails,
        ),
        body: TaskDetailsViewBody(
          task: task,
        ),
      ),
    );
  }
}
