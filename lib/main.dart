import 'package:flutter/material.dart';
import 'package:tasks_app/Core/global/theme/app_dark_theme.dart';
import 'package:tasks_app/Core/helper_functions/init_main.dart';
import 'package:tasks_app/Core/utils/app_router.dart';

void main() async {
  await initMain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
