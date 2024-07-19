import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';

void showCustomLoading({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) => const SpinKitChasingDots(
      color: AppColors.primary,
      size: 50.0,
    ),
  );
}
