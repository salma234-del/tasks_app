import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/add_task_cubit/add_task_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/add_task_form.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(getIt()),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.defaultHorizontalPadding,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.addTask,
                  style: AppStyles.styleRegular18.copyWith(
                    color: AppColors.black1,
                  ),
                ),
                const SizedBox(height: 20),
                const AddTaskForm(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
