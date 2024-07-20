import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/get_tasks_cubit/get_tasks_state.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/gat_tasks_success_state_body.dart';

class GetTasksBuilder extends StatelessWidget {
  const GetTasksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      builder: (context, state) {
        if (state is GetTasksLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: CircularProgressIndicator(),
          );
        } else if (state is GetTasksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is GetTasksSuccess) {
          if (state.tasks.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                AppStrings.noTasks,
                style: AppStyles.styleMedium18,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return GetTasksSuccessStateBody(
              tasks: state.tasks,
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
