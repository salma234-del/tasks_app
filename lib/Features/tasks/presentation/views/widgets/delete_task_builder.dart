import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/delete_task_cubit/delete_task_state.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/custom_alert_dialog.dart';

class DeleteTaskBuilder extends StatelessWidget {
  const DeleteTaskBuilder({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTaskCubit(getIt()),
      child: BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            _buildDeleteTaskSuccess(context);
          } else if (state is DeleteTaskFailure) {
            _buildDeleteTaskFailure(context, state);
          } else {
            _buildDeleteTaskLoading(context);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<DeleteTaskCubit>(context);
          return CustomAlertDailog(
            title: AppStrings.deleteTask,
            body: AppStrings.deleteTaskConfirmation,
            onConfirm: () {
              cubit.deleteTask(id: id);
            },
          );
        },
      ),
    );
  }

  void _buildDeleteTaskLoading(BuildContext context) {
    showCustomLoading(context: context);
  }

  void _buildDeleteTaskFailure(BuildContext context, DeleteTaskFailure state) {
    Navigator.pop(context); // close loading dialog
    Navigator.pop(context); // close delete dialog
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildDeleteTaskSuccess(BuildContext context) {
    Navigator.pop(context); // close loading dialog
    Navigator.pop(context); // close delete dialog
    Navigator.pop(context); // close task details view
    showCustomSnackBar(
      context: context,
      message: AppStrings.deleteTaskSuccess,
      isSuccess: true,
    );
  }
}
