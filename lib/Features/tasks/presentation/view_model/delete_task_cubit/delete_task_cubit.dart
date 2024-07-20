import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/delete_task_cubit/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.tasksRepo) : super(DeleteTaskInitial());

  TasksRepo tasksRepo;

  Future<void> deleteTask({required String id}) async {
    emit(DeleteTaskLoading());
    final result = await tasksRepo.deleteTask(id: id);
    result.fold(
      (failure) => emit(DeleteTaskFailure(errorMessage: failure.errorMessage)),
      (_) => emit(DeleteTaskSuccess()),
    );
  }
}
