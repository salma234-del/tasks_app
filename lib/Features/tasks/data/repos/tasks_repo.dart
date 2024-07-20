import 'package:dartz/dartz.dart';
import 'package:tasks_app/Core/errors/failure.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';

abstract class TasksRepo {
  Future<Either<Failure, void>> addTask({
    required final TaskModel task,
  });
  Stream<Either<Failure, List<TaskModel>>> getTasks();
  Future<Either<Failure, void>> updateTask({
    required final TaskModel task,
  });
  Future<Either<Failure, void>> deleteTask({
    required final String id,
  });
}
