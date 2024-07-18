import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/email_validator.dart';
import 'package:tasks_app/Core/helper_functions/name_validator.dart';
import 'package:tasks_app/Core/helper_functions/password_validator.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/register_cubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          _buildRegisterSuccess(context);
        } else if (state is RegisterFailure) {
          _buildRegisterFailure(context, state);
        } else if (state is RegisterLoading) {
          _buildRegisterLoading(context, state);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.fullName,
                controller: cubit.fullNameController,
                prefixIcon: AppConstants.nameIcon,
                keyboardType: TextInputType.text,
                validator: nameValidator,
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                hintText: AppStrings.email,
                controller: cubit.emailController,
                prefixIcon: AppConstants.emailIcon,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                hintText: AppStrings.pasword,
                controller: cubit.passwordController,
                prefixIcon: AppConstants.passwordIcon,
                keyboardType: TextInputType.visiblePassword,
                validator: passwordValidator,
              ),
              const SizedBox(height: 47),
              CustomButton(
                text: AppStrings.signUp,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
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

  void _buildRegisterSuccess(BuildContext context) {
    Navigator.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: AppStrings.successfullyRegistered,
      isSuccess: true,
    );
    GoRouter.of(context).go(AppRouter.loginView);
  }

  void _buildRegisterFailure(BuildContext context, RegisterFailure state) {
    Navigator.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildRegisterLoading(BuildContext context, RegisterLoading state) {
    showCustomLoading(context: context);
  }
}
