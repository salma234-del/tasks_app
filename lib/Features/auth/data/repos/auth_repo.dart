import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_app/Core/errors/failure.dart';
import 'package:tasks_app/Features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp({required final UserModel userModel});
  Future<Either<Failure, void>> sendVerifyEmail({required final String email});
  Future<Either<Failure, User>> signIn({
    required final String email,
    required final String password,
  });
  Future<Either<Failure, void>> resetPassword({required final String email});
  Future<Either<Failure, void>> signOut();
}
