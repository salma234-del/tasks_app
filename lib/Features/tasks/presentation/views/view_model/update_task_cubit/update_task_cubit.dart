import 'package:bloc/bloc.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/update_task_cubit/update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.tasksRepo) : super(UpdateTaskInitial());

  TasksRepo tasksRepo;

  bool? isCompleted;

  Future<void> updateTask({required TaskModel task}) async {
    emit(UpdateTaskLoading());
    final result = await tasksRepo.updateTask(task: task);
    result.fold(
        (failure) =>
            emit(UpdateTaskFailure(errorMessage: failure.errorMessage)), (_) {
      isCompleted = task.isCompleted;
      emit(UpdateTaskSuccess());
    });
  }
}
