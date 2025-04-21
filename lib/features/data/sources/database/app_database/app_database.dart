import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../categories/table/categories_table.dart';
import '../tasks/table/tasks_table.dart';
import '../categories/dao/categories_dao.dart';
import '../tasks/dao/tasks_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tasks, Categories], daos: [TaskDao, CategoryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  late final TaskDao taskDao = TaskDao(this);
  @override
  late final CategoryDao categoryDao = CategoryDao(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
