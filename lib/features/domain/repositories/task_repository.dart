import '../models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks({
    DateTime? dateStart,
    DateTime? dateEnd,
    List<int>? categoryIds,
  });
  Future<TaskModel?> getTaskById(int id);
  Future<int> insertTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<int> deleteTask(int id);
}
