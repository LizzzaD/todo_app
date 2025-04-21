import 'model.dart';

class TaskModel implements Model {
  TaskModel({
    this.id,
    required this.title,
    required this.categoryId,
    required this.isCompleted,
    required this.date,
  });

  final int? id;
  final String title;
  final int categoryId;
  final bool isCompleted;
  final DateTime date;
}
