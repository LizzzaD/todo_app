import '../../domain/models/task_model.dart';
import '../../domain/repositories/task_repository.dart';
import '../sources/database/tasks/dao/tasks_dao.dart';
import '../sources/mappers/task_mapper.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.taskDao, required this.taskMapper});

  final TaskDao taskDao;
  final TaskMapper taskMapper;

  @override
  Future<int> insertTask(TaskModel taskModel) {
    final companion = taskMapper.toCompanion(taskModel);
    return taskDao.insertTask(companion);
  }

  @override
  Future<List<TaskModel>> getTasks({
    DateTime? dateStart,
    DateTime? dateEnd,
    List<int>? categoryIds,
  }) async {
    final taskEntities = await taskDao.getTasks(
      dateStart: dateStart,
      dateEnd: dateEnd,
      categoryIds: categoryIds,
    );
    return taskEntities.map(taskMapper.fromDataClass).toList();
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    final taskEntity = await taskDao.getTaskById(id);
    if (taskEntity == null) return null;

    return taskMapper.fromDataClass(taskEntity);
  }

  @override
  Future<int> deleteTask(int id) async {
    return taskDao.deleteTask(id);
  }

  @override
  Future<bool> updateTask(TaskModel taskModel) {
    final companion = taskMapper.toCompanion(taskModel);
    return taskDao.updateTask(companion);
  }
}
