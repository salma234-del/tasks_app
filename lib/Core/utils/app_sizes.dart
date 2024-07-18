import 'package:flutter/material.dart';

abstract class AppSizes {
  // screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double defaultHorizontalPadding = 16;
}
