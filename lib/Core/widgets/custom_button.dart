import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.width = double.infinity,
    this.textColor,
    this.bgColor,
    this.preIcon,
    this.preIconColor = Colors.white,
    this.radiusColor = Colors.transparent,
    this.loading = false,
    required this.text,
    required this.onPressed,
    this.selected = true,
    this.verticalPadding = AppSizes.defaultButtonVerticalPadding,
    this.radius,
    super.key,
  });

  final double width;
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? bgColor;
  final Color radiusColor;
  final bool loading;
  final IconData? preIcon;
  final Color? preIconColor;
  final bool? selected;
  final double verticalPadding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
          ),
          backgroundColor: bgColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(radius ?? AppSizes.defaultButtonRadius),
            side: BorderSide(
              color: radiusColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (preIcon != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    preIcon,
                    color: preIconColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            Text(
              text,
              style: AppStyles.styleMedium18.copyWith(
                color: textColor ?? AppColors.white1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
