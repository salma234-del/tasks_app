import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final VoidCallback? suffixIconOnPressed;
  final String? Function(String?)? validator;
  final double radius;
  final bool isExpanded;
  final int? maxLines;
  final bool withFocusBorder;
  final String? hintText;

  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIconOnPressed,
    required this.validator,
    this.radius = AppSizes.textFormFieldBorderRadius,
    this.isExpanded = false,
    this.maxLines = 1,
    this.withFocusBorder = true,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.black1),
      onSaved: onSaved,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      cursorColor: AppColors.primary,
      expands: isExpanded,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        //isCollapsed: true,
        hintStyle: AppStyles.styleRegular18,
        hintText: hintText,
        fillColor: AppColors.white1,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            AppSizes.textFormFieldBorderRadius,
          ),
        ),
        // border: buildTextFieldBorder(),
        // enabledBorder: buildTextFieldBorder(),
        // focusedBorder: buildTextFieldBorder(
        //   color: withFocusBorder ? AppColors.primary : AppColors.black2,
        // ),
        prefixIcon: Icon(
          prefixIcon,
          size: 24,
          color: AppColors.black1,
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            suffixIcon,
            color: AppColors.black2,
            size: 24,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildTextFieldBorder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.textFormFieldBorderRadius),
      borderSide: BorderSide(
        color: color ?? AppColors.black2,
      ),
    );
  }
}
