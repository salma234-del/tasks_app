import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasks_app/Core/errors/failure.dart';
import 'package:tasks_app/Core/errors/server_failure.dart';
import 'package:tasks_app/Core/services/tasks_firestore_service.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';

class TasksRepoImpl implements TasksRepo {
  TasksFirestoreService tasksFirestoreService;

  TasksRepoImpl(this.tasksFirestoreService);

  @override
  Future<Either<Failure, void>> addTask({required TaskModel task}) async {
    try {
      await tasksFirestoreService.setData(data: task.toJson());
      return const Right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailure.fromFirebaseException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
