import '../../domain/models/task_with_category_model.dart';

sealed class TaskState {}

class TasksInitial extends TaskState {}

class TasksLoading extends TaskState {}

class TasksLoaded extends TaskState {
  TasksLoaded(this.tasksWithCategories);
  final List<TaskWithCategory> tasksWithCategories;
}

class TasksError extends TaskState {
  TasksError(this.error);
  final String error;
}
