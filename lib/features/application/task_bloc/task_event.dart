import '../../domain/models/task_model.dart';

sealed class TaskEvent {}

class LoadTasksEvent extends TaskEvent {
  LoadTasksEvent({this.dateStart, this.dateEnd, this.categoryIds});

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final List<int>? categoryIds;
}

class AddTaskEvent extends TaskEvent {
  AddTaskEvent({required this.taskModel});
  final TaskModel taskModel;
}

class DeleteTaskEvent extends TaskEvent {
  DeleteTaskEvent({required this.taskId});
  final int taskId;
}
