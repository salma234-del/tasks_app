import 'package:flutter/material.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.bgBegin,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: AppConstants.defaultFontFamily,
      ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    shape: CircleBorder(),
  ),
);
