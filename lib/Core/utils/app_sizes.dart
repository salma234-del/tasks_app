import 'package:flutter/material.dart';

abstract class AppSizes {
  // screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static const double defaultHorizontalPadding = 16;
  static const double defaultButtonVerticalPadding = 8;
  static const double defaultButtonRadius = 10;
  static const double textFormFieldBorderRadius = 5;
}
