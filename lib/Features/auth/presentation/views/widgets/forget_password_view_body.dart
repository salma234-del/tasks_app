import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_assets.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';
import 'package:tasks_app/Features/auth/presentation/views/widgets/forget_password_form.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.defaultHorizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(AppAssets.logo),
              const SizedBox(height: 25),
              const Text(
                AppStrings.forgetPassword,
                style: AppStyles.styleMedium25,
              ),
              const SizedBox(height: 4),
              const Text(
                AppStrings.forgetPasswordDescription,
                style: AppStyles.styleMedium18,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              const ForgetPasswordForm(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
