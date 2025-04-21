import 'package:drift/drift.dart';

import '../../../domain/models/task_model.dart';
import '../database/app_database/app_database.dart';
import 'drift_mapper.dart';

class TaskMapper implements DriftMapper<TaskModel, Task, TasksCompanion> {
  @override
  TaskModel fromDataClass(Task dataClass) {
    return TaskModel(
      id: dataClass.id,
      title: dataClass.title,
      categoryId: dataClass.categoryId,
      isCompleted: dataClass.isCompleted,
      date: dataClass.date,
    );
  }

  @override
  TasksCompanion toCompanion(TaskModel model) {
    return TasksCompanion(
      id: model.id != null ? Value(model.id!) : const Value.absent(),
      title: Value(model.title),
      categoryId: Value(model.categoryId),
      isCompleted: Value(model.isCompleted),
      date: Value(model.date),
    );
  }
}
