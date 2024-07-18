import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/errors/failure.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Features/auth/data/models/user_model.dart';
import 'package:tasks_app/Features/auth/data/repos/auth_repo.dart';
import 'package:tasks_app/Features/auth/presentation/view_model/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePass = true;
  IconData suffixIcon = AppConstants.visiblePasswordIcon;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterChangeAutovalidateMode());
  }

  void changeObscurePass() {
    obscurePass = !obscurePass;
    suffixIcon = obscurePass
        ? AppConstants.visiblePasswordIcon
        : AppConstants.invisiblePasswordIcon;
    emit(RegisterChangeObscurePass());
  }

  Future<void> register() async {
    emit(RegisterLoading());
    final result = await authRepo.signUp(
      userModel: UserModel(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.errorMessage)),
      (user) async {
        final verification = await sendVerificationEmail();
        verification.fold(
          (failure) =>
              emit(RegisterFailure(errorMessage: failure.errorMessage)),
          (user) => emit(RegisterSuccess()),
        );
      },
    );
  }

  Future<Either<Failure, void>> sendVerificationEmail() async {
    final verification =
        await authRepo.sendVerifyEmail(email: emailController.text);
    return verification;
  }
}
