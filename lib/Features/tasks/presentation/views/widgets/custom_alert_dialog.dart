import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class CustomAlertDailog extends StatelessWidget {
  const CustomAlertDailog({
    required this.title,
    required this.body,
    required this.onConfirm,
    this.confirmText,
    super.key,
  });
  final String title;
  final String body;
  final VoidCallback onConfirm;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgBegin,
      title: Text(
        title,
      ),
      icon: const Icon(
        Icons.delete,
        color: AppColors.red,
        size: 30,
      ),
      content: Text(
        body,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            AppStrings.cancel,
            style: AppStyles.styleMediumWhite14,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: AppColors.bgEnd),
          onPressed: () {
            onConfirm();
          },
          child: Text(
            confirmText ?? AppStrings.delete,
            style: AppStyles.styleMediumWhite14,
          ),
        ),
      ],
    );
  }
}
