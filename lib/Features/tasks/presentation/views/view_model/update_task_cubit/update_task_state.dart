import 'package:tasks_app/Features/tasks/data/models/task_model.dart';

abstract class UpdateTaskState {}

class UpdateTaskInitial extends UpdateTaskState {}

class UpdateTaskChangeAutoValidateMode extends UpdateTaskState {}

class UpdateTaskLoading extends UpdateTaskState {}

class UpdateTaskSuccess extends UpdateTaskState {
  final TaskModel task;

  UpdateTaskSuccess({
    required this.task,
  });
}

class UpdateTaskFailure extends UpdateTaskState {
  final String errorMessage;

  UpdateTaskFailure({required this.errorMessage});
}
