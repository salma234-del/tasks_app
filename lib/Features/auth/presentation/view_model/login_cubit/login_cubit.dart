import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Features/auth/data/repos/auth_repo.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePass = true;
  IconData suffixIcon = AppConstants.visiblePasswordIcon;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(LoginChangeAutovalidateMode());
  }

  void changeObscurePass() {
    obscurePass = !obscurePass;
    suffixIcon = obscurePass
        ? AppConstants.visiblePasswordIcon
        : AppConstants.invisiblePasswordIcon;
    emit(LoginChangeObscurePass());
  }

  Future<void> login() async {
    emit(LoginLoading());

    final result = await authRepo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (user) async {
        if (!user.emailVerified) {
          await authRepo.sendVerifyEmail(email: emailController.text);
          emit(LoginFailure(errorMessage: AppStrings.checkEmail));
        } else {
          emit(LoginSuccess(user));
        }
      },
    );
  }
}
