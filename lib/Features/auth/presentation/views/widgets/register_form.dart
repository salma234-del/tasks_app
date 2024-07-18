import 'package:flutter/material.dart';
import 'package:tasks_app/Core/helper_functions/email_validator.dart';
import 'package:tasks_app/Core/helper_functions/name_validator.dart';
import 'package:tasks_app/Core/helper_functions/password_validator.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.fullName,
            controller: TextEditingController(),
            prefixIcon: AppConstants.nameIcon,
            keyboardType: TextInputType.text,
            validator: nameValidator,
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            hintText: AppStrings.email,
            controller: TextEditingController(),
            prefixIcon: AppConstants.emailIcon,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            hintText: AppStrings.pasword,
            controller: TextEditingController(),
            prefixIcon: AppConstants.passwordIcon,
            keyboardType: TextInputType.visiblePassword,
            validator: passwordValidator,
          ),
          const SizedBox(height: 47),
          CustomButton(
            text: AppStrings.signUp,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
