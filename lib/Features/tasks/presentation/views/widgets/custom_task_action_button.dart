import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class CustomTaskActionButton extends StatelessWidget {
  const CustomTaskActionButton({
    required this.onPressed,
    required this.text,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgEnd,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 2,
          ),
          child: Column(
            children: [
              icon,
              const SizedBox(height: 12),
              Text(
                text,
                style: AppStyles.styleMediumWhite14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
