import 'package:flutter/widgets.dart';
import 'package:tasks_app/Features/tasks/presentation/views/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const TaskItem(),
      separatorBuilder: (context, index) => const SizedBox(height: 35),
      itemCount: 10,
    );
  }
}
