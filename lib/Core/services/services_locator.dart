import 'package:get_it/get_it.dart';
import 'package:tasks_app/Core/services/firebase_auth_service.dart';
import 'package:tasks_app/Core/services/tasks_firestore_service.dart';
import 'package:tasks_app/Features/auth/data/repos/auth_repo.dart';
import 'package:tasks_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo_impl.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  static void setup() {
    getIt.registerLazySingleton(() => FirebaseAuthService());
    getIt.registerLazySingleton(() => TasksFirestoreService());
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
    getIt.registerLazySingleton<TasksRepo>(() => TasksRepoImpl(getIt()));
  }
}
