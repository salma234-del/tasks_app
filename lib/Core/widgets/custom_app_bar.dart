import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgBegin,
      title: Text(
        title,
        style: AppStyles.styleMedium16,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
