import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/reset_pass_cubit/reset_pass_cubit.dart';
import 'package:tasks_app/Features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPassCubit(getIt()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: const ForgetPasswordViewBody(),
      ),
    );
  }
}
