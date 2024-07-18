import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';

abstract class AppStyles {
  static const TextStyle styleMedium25 = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleMedium18 = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleRegular18 = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.black2,
  );

  static const TextStyle styleMedium14 = TextStyle(
    fontFamily: AppConstants.poppinsFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white2,
  );
}
