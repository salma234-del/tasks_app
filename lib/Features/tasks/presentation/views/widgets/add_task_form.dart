import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/helper_functions/empty_validator.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/add_task_cubit/add_task_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/add_task_cubit/add_task_state.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          _buildAddTaskSuccess(context);
        } else if (state is AddTaskFailure) {
          _buildAddTaskFailure(context, state);
        } else if (state is AddTaskLoading) {
          _buildAddTaskLoading(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AddTaskCubit>(context);
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      bgColor: AppColors.white1,
                      radiusColor: AppColors.primary,
                      textColor: AppColors.bgEnd,
                      text: AppStrings.cancel,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: CustomButton(
                      text: AppStrings.add,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.addTask();
                        } else {
                          cubit.changeAutoValidateMode();
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _buildAddTaskLoading(BuildContext context) {
    showCustomLoading(context: context);
  }

  void _buildAddTaskFailure(BuildContext context, AddTaskFailure state) {
    Navigator.pop(context);
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildAddTaskSuccess(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    showCustomSnackBar(
      context: context,
      message: AppStrings.taskAdded,
      isSuccess: true,
    );
  }
}
