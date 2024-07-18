import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_assets.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.defaultHorizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(AppAssets.logo),
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text: AppStrings.welcomeBack,
                  style: AppStyles.styleMedium25,
                  children: [
                    TextSpan(
                      text: AppStrings.appName,
                      style: AppStyles.styleMedium25.copyWith(
                        fontFamily: AppConstants.darumadropOneFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                AppStrings.haveProductiveDay,
                style: AppStyles.styleMedium18,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
