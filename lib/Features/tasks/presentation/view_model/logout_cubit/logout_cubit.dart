import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/auth/data/repos/auth_repo.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepo) : super(LogoutInitial());

  AuthRepo authRepo;

  Future<void> logout() async {
    emit(LogoutLoading());

    final result = await authRepo.signOut();

    result.fold(
      (failure) => emit(LogoutFailure(errorMessage: failure.errorMessage)),
      (_) => emit(LogoutSuccess()),
    );
  }
}
