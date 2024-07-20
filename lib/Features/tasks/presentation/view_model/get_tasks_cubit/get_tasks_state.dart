import 'package:tasks_app/Features/tasks/data/models/task_model.dart';

abstract class GetTasksState {}

class GetTasksInitial extends GetTasksState {}

class GetTasksLoading extends GetTasksState {}

class GetTasksSuccess extends GetTasksState {
  final List<TaskModel> tasks;

  GetTasksSuccess({required this.tasks});
}

class GetTasksFailure extends GetTasksState {
  final String errorMessage;

  GetTasksFailure({required this.errorMessage});
}
