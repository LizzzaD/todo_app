import 'package:drift/drift.dart';
import '../../app_database/app_database.dart';
import '../table/tasks_table.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  /// CREATE
  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);

  /// READ
  Future<List<Task>> getTasks({
    DateTime? dateStart,
    DateTime? dateEnd,
    List<int>? categoryIds,
  }) {
    final query = select(tasks);

    if (dateStart != null) {
      query.where((t) => t.date.isBiggerOrEqualValue(dateStart));
    }

    if (dateEnd != null) {
      query.where((t) => t.date.isSmallerThanValue(dateEnd));
    }

    if (categoryIds != null && categoryIds.isNotEmpty) {
      query.where((t) => t.categoryId.isIn(categoryIds));
    }

    return query.get();
  }

  Future<Task?> getTaskById(int id) {
    return (select(tasks)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// UPDATE
  Future<bool> updateTask(TasksCompanion task) => update(tasks).replace(task);

  /// DELETE
  Future<int> deleteTask(int id) =>
      (delete(tasks)..where((t) => t.id.equals(id))).go();
}
