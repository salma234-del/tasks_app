import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/empty_validator.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/update_task_cubit/update_task_state.dart';

class EditTaskForm extends StatelessWidget {
  const EditTaskForm({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
      listener: (context, state) {
        if (state is UpdateTaskSuccess) {
          _buildUpdateTaskSuccess(context, state);
        } else if (state is UpdateTaskFailure) {
          _buildUpdateTaskFailure(context, state);
        } else if (state is UpdateTaskLoading) {
          _buildUpdateTaskLoading(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<UpdateTaskCubit>(context);
        initControllersValues(cubit);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                controller: cubit.titleController,
                validator: emptyValidator,
                filledColor: AppColors.bgEnd,
                hintText: AppStrings.taskTitle,
                hintStyle: AppStyles.styleRegular16,
                textColor: AppColors.white1,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 34),
              CustomTextFormField(
                controller: cubit.descriptionController,
                validator: emptyValidator,
                filledColor: AppColors.bgEnd,
                hintText: AppStrings.taskDescription,
                hintStyle: AppStyles.styleRegular16,
                textColor: AppColors.white1,
                maxLines: AppConstants.taskDescriptionMaxLines,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: AppStrings.edit,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.updateTask(
                      task: TaskModel(
                        id: task.id,
                        title: cubit.titleController.text,
                        description: cubit.descriptionController.text,
                        isCompleted: task.isCompleted,
                        createdAt: task.createdAt,
                      ),
                    );
                    primaryFocus?.unfocus();
                  } else {
                    cubit.changeAutoValidateMode();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void initControllersValues(UpdateTaskCubit cubit) {
    cubit.titleController.text = cubit.titleController.text.isEmpty
        ? task.title
        : cubit.titleController.text;
    cubit.descriptionController.text = cubit.descriptionController.text.isEmpty
        ? task.description
        : cubit.descriptionController.text;
  }

  void _buildUpdateTaskSuccess(BuildContext context, UpdateTaskSuccess state) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    GoRouter.of(context).push(
      AppRouter.taskDetailsView,
      extra: state.task,
    );
    showCustomSnackBar(
      context: context,
      message: AppStrings.editTaskSuccess,
      isSuccess: true,
    );
  }

  void _buildUpdateTaskFailure(BuildContext context, UpdateTaskFailure state) {
    Navigator.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildUpdateTaskLoading(BuildContext context) {
    showCustomLoading(context: context);
  }
}
