abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {}

class DeleteTaskFailure extends DeleteTaskState {
  final String errorMessage;

  DeleteTaskFailure({required this.errorMessage});
}
