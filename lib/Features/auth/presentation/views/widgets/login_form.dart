import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/email_validator.dart';
import 'package:tasks_app/Core/helper_functions/password_validator.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_loading.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/login_cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          _buildLoginSuccess(context);
        } else if (state is LoginFailure) {
          _buildLoginFailure(context, state);
        } else if (state is LoginLoading) {
          _buildLoginLoading(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
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
              const SizedBox(height: 56),
              CustomTextFormField(
                hintText: AppStrings.pasword,
                controller: cubit.passwordController,
                prefixIcon: AppConstants.passwordIcon,
                keyboardType: TextInputType.visiblePassword,
                obscureText: cubit.obscurePass,
                suffixIcon: cubit.suffixIcon,
                suffixIconOnPressed: cubit.changeObscurePass,
                validator: passwordValidator,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.forgetPasswordView);
                },
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    AppStrings.forgetPassword,
                    style: AppStyles.styleMedium14.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: AppStrings.signIn,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login();
                    primaryFocus?.unfocus();
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _buildLoginSuccess(BuildContext context) {
    Navigator.of(context).pop();
    GoRouter.of(context).go('/home');
  }

  void _buildLoginFailure(BuildContext context, LoginFailure state) {
    Navigator.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildLoginLoading(BuildContext context) {
    showCustomLoading(context: context);
  }
}
