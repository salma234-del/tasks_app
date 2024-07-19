import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/logout_cubit/logout_cubit.dart';
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
      ],
      child: Scaffold(
        appBar: const CustomTasksViewAppBar(),
        body: const TasksViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
