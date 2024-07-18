import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/email_validator.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/reset_pass_cubit/reset_pass_cubit.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/reset_pass_cubit/reset_pass_state.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassCubit, ResetPassState>(
      listener: (context, state) {
        if (state is ResetPassSuccess) {
          _buildResetPassSuccess(context);
        } else if (state is ResetPassFailure) {
          _buildResetPassFailure(context, state);
        } else if (state is ResetPassLoading) {
          _buildResetPassLoading(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ResetPassCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.email,
                controller: cubit.emailController,
                prefixIcon: AppConstants.emailIcon,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: AppStrings.confirm,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.resetPassword();
                    primaryFocus?.unfocus();
                  } else {
                    cubit.changeAutovalidateMode();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

void _buildResetPassSuccess(BuildContext context) {
  Navigator.of(context).pop();
  showCustomSnackBar(
    context: context,
    message: AppStrings.resetPassSuccess,
    isSuccess: true,
  );
  GoRouter.of(context).go(AppRouter.loginView);
}

void _buildResetPassFailure(BuildContext context, ResetPassFailure state) {
  Navigator.of(context).pop();
  showCustomSnackBar(
    context: context,
    message: state.errorMessage,
    isSuccess: false,
  );
}

void _buildResetPassLoading(BuildContext context) {
  showCustomLoading(context: context);
}
