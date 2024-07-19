import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.screenWidth(context),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.green,
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              'salma',
              style: AppStyles.styleMediumBlack14,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
