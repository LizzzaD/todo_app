import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get categoryId => integer()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get date => dateTime()();
}
