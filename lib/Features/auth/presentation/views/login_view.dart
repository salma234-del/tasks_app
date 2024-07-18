import 'package:flutter/material.dart';
import 'package:tasks_app/Features/auth/presentation/views/widgets/login_view_body.dart';

class LiginView extends StatelessWidget {
  const LiginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
