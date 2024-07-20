import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';

abstract class AppStyles {
  static const TextStyle styleMedium25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleMedium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleSemiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle styleRegular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.black2,
  );
  static const TextStyle styleRegular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle styleMedium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleMediumWhite14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white2,
  );

  static const TextStyle styleMediumBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black1,
  );
}
