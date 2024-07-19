import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/data/repos/tasks_repo.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/add_task_cubit/add_task_state.dart';
import 'package:uuid/uuid.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  TasksRepo tasksRepo;

  AddTaskCubit(this.tasksRepo) : super(AddTaskInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changeAutoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(AddTaskChangeAutoValidate());
  }

  Future<void> addTask() async {
    emit(AddTaskLoading());
    final result = await tasksRepo.addTask(
      task: TaskModel(
        id: const Uuid().v4(),
        title: titleController.text,
        description: descriptionController.text,
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
    );
    result.fold(
      (failure) => emit(AddTaskFailure(errorMessage: failure.errorMessage)),
      (_) => emit(AddTaskSuccess()),
    );
  }
}
