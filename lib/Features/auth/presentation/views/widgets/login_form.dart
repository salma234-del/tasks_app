import 'package:flutter/material.dart';
import 'package:tasks_app/Core/helper_functions/email_validator.dart';
import 'package:tasks_app/Core/helper_functions/password_validator.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.email,
            controller: TextEditingController(),
            prefixIcon: AppConstants.emailIcon,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          const SizedBox(height: 56),
          CustomTextFormField(
            hintText: AppStrings.pasword,
            controller: TextEditingController(),
            prefixIcon: AppConstants.passwordIcon,
            keyboardType: TextInputType.visiblePassword,
            validator: passwordValidator,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              AppStrings.forgetPassword,
              style: AppStyles.styleMedium14.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: AppStrings.signIn,
            onPressed: () {},
          ),
          const SizedBox(height: 19),
          RichText(
            text: TextSpan(
              text: AppStrings.dontHaveAccount,
              style: AppStyles.styleMedium14,
              children: [
                TextSpan(
                  text: AppStrings.signUp,
                  style: AppStyles.styleMedium14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
