import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/task_with_category_model.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this.repository, this.categoryRepository) : super(TasksInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  final TaskRepository repository;
  final CategoryRepository categoryRepository;

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TasksLoading());
    try {
      final tasks = await repository.getTasks(
        dateStart: event.dateStart,
        dateEnd: event.dateEnd,
        categoryIds: event.categoryIds,
      );
      final categories = await categoryRepository.getAllCategories();

      final tasksWithCategory =
          tasks.map((task) {
            final category = categories.firstWhere(
              (c) => c.id == task.categoryId,
            );
            return TaskWithCategory(task: task, category: category);
          }).toList();

      emit(TasksLoaded(tasksWithCategory));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    try {
      await repository.insertTask(event.taskModel);
      add(LoadTasksEvent());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await repository.deleteTask(event.taskId);
      add(LoadTasksEvent());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }
}
