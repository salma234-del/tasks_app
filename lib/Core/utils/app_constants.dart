import 'package:flutter/material.dart';

abstract class AppConstants {
  static const defaultFontFamily = 'Poppins';
  static const appNameFontFamily = 'Darumadrop_One';
  static const emailIcon = Icons.email;
  static const passwordIcon = Icons.lock;
  static const nameIcon = Icons.person;
  static RegExp nameRegex = RegExp(r"^[a-zA-Z]+(?:[-\'\s][a-zA-Z]+)*$");
  static RegExp emailRegex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
}
