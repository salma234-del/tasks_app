import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_app/Core/errors/failure.dart';
import 'package:tasks_app/Core/errors/server_failure.dart';
import 'package:tasks_app/Core/services/firebase_auth_service.dart';
import 'package:tasks_app/Features/auth/data/models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, User>> signUp(
      {required final UserModel userModel}) async {
    try {
      final User? firebaseUser =
          await firebaseAuthService.signUpWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
        name: userModel.fullName,
      );
      if (firebaseUser != null) {
        return Right(firebaseUser);
      } else {
        return Left(ServerFailure(errorMessage: 'Register failed.'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> sendVerifyEmail(
      {required final String email}) async {
    try {
      await firebaseAuthService.verifyEmail();
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> signIn(
      {required final String email, required final String password}) async {
    try {
      final User? firebaseUser =
          await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseUser != null) {
        return Right(firebaseUser);
      } else {
        return Left(ServerFailure(errorMessage: 'Login failed.'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
      {required final String email}) async {
    try {
      await firebaseAuthService.resetPassword(email: email);
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
