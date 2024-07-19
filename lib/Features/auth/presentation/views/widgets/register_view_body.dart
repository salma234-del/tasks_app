import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/utils/app_assets.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_background_container.dart';
import 'package:tasks_app/Features/auth/presentation/views/widgets/register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
              RichText(
                text: TextSpan(
                  text: AppStrings.welcomeTo,
                  style: AppStyles.styleMedium25,
                  children: [
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: AppStrings.appName,
                      style: AppStyles.styleMedium25.copyWith(
                        fontFamily: AppConstants.appNameFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                AppStrings.createAccount,
                style: AppStyles.styleMedium18,
              ),
              const SizedBox(height: 48),
              const RegisterForm(),
              const SizedBox(height: 19),
              RichText(
                text: TextSpan(
                  text: AppStrings.haveAccount,
                  style: AppStyles.styleMediumWhite14,
                  children: [
                    TextSpan(
                      text: AppStrings.signIn,
                      style: AppStyles.styleMediumWhite14.copyWith(
                        color: AppColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.loginView);
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
