import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';
import 'package:tasks_app/Features/tasks/presentation/view_model/get_tasks_cubit/get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit(this.tasksRepo) : super(GetTasksInitial());

  TasksRepo tasksRepo;

  void getTasks() {
    emit(GetTasksLoading());
    tasksRepo.getTasks().listen((event) {
      event.fold(
        (failure) => emit(GetTasksFailure(errorMessage: failure.errorMessage)),
        (tasks) => emit(GetTasksSuccess(tasks: tasks)),
      );
    });
  }
}
