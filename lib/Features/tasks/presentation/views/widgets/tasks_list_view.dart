import 'package:flutter/widgets.dart';
import 'package:tasks_app/Features/tasks/data/models/task_model.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    required this.tasks,
    super.key,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => TaskItem(task: tasks[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: tasks.length,
    );
  }
}
