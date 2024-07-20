import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/logout_cubit/logout_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/add_task_bottom_sheet.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/custom_tasks_view_app_bar.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/tasks_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => GetTasksCubit(getIt())..getTasks(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomTasksViewAppBar(),
        body: const TasksViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => const AddTaskBottomSheet(),
            );
          },
          child: const Icon(
            Icons.add,
            color: AppColors.white1,
          ),
        ),
      ),
    );
  }
}
